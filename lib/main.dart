import 'package:flutter/material.dart';
import 'package:raffle_application/models/owner.dart';
import 'package:raffle_application/services/web3.dart';

import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageDAO Raffles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PageDAO Raffles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool fetchedOwnersList = false;
  bool shuffledTix = false;
  List<Owner> owners = [];
  Map<int, String> ticketsDict = {};
  Map<int, String> shuffledTickets = {};
  int tixWidgetKey = 1;
  MapEntry<int, String>? winningTicket;

  String formatAddress(String input) {
    if (input.length < 10) {
      throw ArgumentError('Input string must have at least 14 characters');
    }
    String first3 = input.substring(0, 3);
    String last6 = input.substring(input.length - 6);
    return '$first3...$last6';
  }

  void buildTixDict(List<Owner> owners) {
    int lastKey = ticketsDict.isEmpty
        ? 1
        : ticketsDict.keys.reduce((a, b) => a > b ? a : b);

    for (var owner in owners) {
      for (var i = 0; i < owner.quantity; i++) {
        ticketsDict[lastKey] = owner.address;
        lastKey += 1;
      }
    }
    tixWidgetKey++;
  }

  void shuffleTix() {
    List<String> values = ticketsDict.values.toList();
    values.shuffle();

    int index = 0;
    ticketsDict.forEach((key, _) {
      shuffledTickets[key] = values[index];
      index++;
    });

    tixWidgetKey++;
  }

  MapEntry<int, String> drawTicket() {
    Map<int, String> tixDict = shuffledTix ? shuffledTickets : ticketsDict;
    Random random = Random();
    List<MapEntry<int, String>> entries = tixDict.entries.toList();

    // Select a random entry
    MapEntry<int, String> randomEntry = entries[random.nextInt(entries.length)];
    print('Random key: ${randomEntry.key}, Value: ${randomEntry.value}');
    return randomEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SelectionArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  winningTicket = drawTicket();
                  setState(() {});
                },
                child: const Text("DRAW THE WINNING TICKET"),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("The winning ticket is..."),
              const SizedBox(
                height: 15,
              ),
              if (winningTicket != null)
                Column(
                  children: [
                    Text("Ticket #: ${winningTicket!.key}"),
                    Text("Owner Address: ${winningTicket!.value}"),
                  ],
                ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (!fetchedOwnersList) {
                            List<Owner>? response = await fetchNFTHolders();
                            if (response != null) {
                              fetchedOwnersList = true;
                              owners = response;
                              buildTixDict(owners); // build the tix dict
                            }
                            setState(() {});
                          }
                        },
                        child: const Text("Get Raffle Tix!!!"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        // height: 500,
                        width: 210,
                        child: ListView.builder(
                          itemCount: owners.length,
                          shrinkWrap: true,
                          itemExtent: 35,
                          itemBuilder: (context, idx) {
                            return InkWell(
                              onTap: () {
                                print("see owner ${owners[idx].address}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 14),
                                child: Row(
                                  children: [
                                    Text(formatAddress(owners[idx].address)),
                                    Text("   Tix: ${owners[idx].quantity}   "),
                                    if (ticketsDict.isNotEmpty)
                                      Text(
                                          "%: ${(owners[idx].quantity / ticketsDict.length).toStringAsFixed(3)}")
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          print("shuffle the tickets");
                          // print(ticketsDict);
                          shuffleTix();
                          setState(() {
                            shuffledTix = true;
                          });
                        },
                        child: const Text("Shuffle!"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("Tickets"),
                      SizedBox(
                        key: Key("$tixWidgetKey"),
                        width: 180,
                        child: ListView.builder(
                          itemCount: shuffledTix
                              ? shuffledTickets.length
                              : ticketsDict.length,
                          shrinkWrap: true,
                          itemExtent: 28,
                          itemBuilder: (context, idx) {
                            Map<int, String> tixDict =
                                shuffledTix ? shuffledTickets : ticketsDict;
                            int ticketNum = tixDict.keys.toList()[idx];
                            String ownerAddress = tixDict[ticketNum]!;
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: Text(
                                  "$ticketNum:   ${formatAddress(ownerAddress)}"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
