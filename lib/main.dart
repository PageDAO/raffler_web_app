import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          ElevatedButton(
            onPressed: () {
              print("connect wallet");
            },
            child: const Text("connect wallet"),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("get prize list");
                      },
                      child: const Text("See Prize List!!!"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 200,
                      width: 80,
                      child: ListView.builder(
                        itemCount: 15,
                        shrinkWrap: true,
                        itemExtent: 25,
                        itemBuilder: (context, idx) {
                          return InkWell(
                            onTap: () {
                              print("see prize $idx");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: Text("Prize $idx"),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("get all Raffle tickets");
                      },
                      child: const Text("Get Raffle Tix!!!"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 200,
                      width: 100,
                      child: ListView.builder(
                        itemCount: 15,
                        shrinkWrap: true,
                        itemExtent: 25,
                        itemBuilder: (context, idx) {
                          return InkWell(
                            onTap: () {
                              print("see prize $idx");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 22),
                              child: Text("Ticket $idx"),
                            ),
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
            ElevatedButton(
              onPressed: () {
                print("generate a random number from list");
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
            const Text("Ticket 45!!!"),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                print("generate a random number from list");
              },
              child: const Text("Send prize to the winner"),
            ),
          ],
        ),
      ),
    );
  }
}
