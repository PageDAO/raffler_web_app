import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:raffle_application/models/NFTContract.dart';
import 'package:raffle_application/models/owner.dart';
import 'package:raffle_application/pages/home_page/widgets/nft_input_form.dart';
import 'package:raffle_application/services/string_functs.dart';
import 'package:raffle_application/services/tickets.dart';
import 'package:raffle_application/services/web3.dart';

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
  List<NFT> nfts = [];

  bool nftMenuOpen = false;

  TextEditingController chainIDController = TextEditingController();
  TextEditingController contractAddressController = TextEditingController();
  TextEditingController tokenIDController = TextEditingController();
  final TextEditingController apiKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          SizedBox(
            width: 165,
            height: 36,
            child: TextFormField(
              controller: apiKeyController,
              obscureText: true,
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  labelText: '  OpenSea API Key',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SelectionArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width - 24,
                      minHeight: MediaQuery.of(context).size.height - 58),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      IntrinsicWidth(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Ticket NFTs"),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    nftMenuOpen
                                        ? IconButton(
                                            tooltip: "Cancel",
                                            constraints: const BoxConstraints(),
                                            padding: const EdgeInsets.all(0),
                                            splashRadius: 28,
                                            onPressed: () {
                                              nftMenuOpen = !nftMenuOpen;
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.cancel))
                                        : const Icon(
                                            Icons.cancel,
                                            color: Colors.transparent,
                                          ),
                                    nftMenuOpen
                                        ? InkWell(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            onTap: () {
                                              nftMenuOpen = !nftMenuOpen;
                                              nfts.add(NFT(
                                                  chain: chainIDController.text,
                                                  id: tokenIDController.text,
                                                  address:
                                                      contractAddressController
                                                          .text));
                                              // widget.onSubmit(NFT(
                                              //     chain: "optimism",
                                              //     id: "1",
                                              //     address:
                                              //         '0x464c77eea43f403b9548b61a2ac749cae954c21b'));
                                              setState(() {});
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 1),
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                              ),
                                            ),
                                          )
                                        : IconButton(
                                            tooltip: "Add your ticket NFTs",
                                            constraints: const BoxConstraints(),
                                            padding: const EdgeInsets.all(0),
                                            splashRadius: 28,
                                            onPressed: () {
                                              nftMenuOpen = !nftMenuOpen;
                                              setState(() {});
                                            },
                                            icon: Icon(nftMenuOpen
                                                ? Icons.cancel
                                                : Icons.add)),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 225,
                              height: 100,
                              constraints: const BoxConstraints(
                                  minHeight: 100, maxHeight: 205),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2)),
                              child: nftMenuOpen
                                  ? NFTInputForm(
                                      chainIDController: chainIDController,
                                      contractAddressController:
                                          contractAddressController,
                                      tokenIDController: tokenIDController,
                                    )
                                  : ListView.builder(
                                      itemCount: nfts.length,
                                      shrinkWrap: true,
                                      itemExtent: 25,
                                      itemBuilder: (context, idx) {
                                        NFT nft = nfts[idx];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: Row(
                                            children: [
                                              Text("$idx. "),
                                              Text(nft.chain),
                                              const Text("  "),
                                              Text(formatAddress(nft.address)),
                                              const Text("    "),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (idx >= 0 &&
                                                        idx < nfts.length) {
                                                      nfts.removeAt(idx);
                                                      print(
                                                          "Element at index $idx removed. Updated list: $nfts");
                                                    } else {
                                                      print(
                                                          "Index $idx is out of bounds.");
                                                    }
                                                    print(nfts);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          winningTicket = drawTicket(
                              shuffledTix ? shuffledTickets : ticketsDict);
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
                                  if (apiKeyController.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Input your OpenSea API",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 3,
                                        webShowClose: true,
                                        webPosition: "right",
                                        webBgColor:
                                            "linear-gradient(to right, #33FFD3, #33FFD3)",
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        textColor: const Color.fromARGB(
                                            255, 32, 32, 32),
                                        fontSize: 14.0);
                                  }
                                  if (nfts.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Add your NFT",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.TOP,
                                        timeInSecForIosWeb: 3,
                                        webShowClose: true,
                                        webPosition: "right",
                                        webBgColor:
                                            "linear-gradient(to right, #33FFD3, #33FFD3)",
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        textColor: const Color.fromARGB(
                                            255, 32, 32, 32),
                                        fontSize: 14.0);
                                  }
                                  if (!fetchedOwnersList &&
                                      apiKeyController.text.isNotEmpty) {
                                    List<Owner>? response =
                                        await fetchNFTHolders(
                                            nfts, apiKeyController.text);
                                    if (response != null) {
                                      fetchedOwnersList = true;
                                      owners = response;
                                      ticketsDict = buildTixDict(
                                          owners); // build the tix dict
                                    }
                                    setState(() {
                                      tixWidgetKey++;
                                    });
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
                                        print(
                                            "see owner ${owners[idx].address}");
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 14),
                                        child: Row(
                                          children: [
                                            Text(formatAddress(
                                                owners[idx].address)),
                                            Text(
                                                "   Tix: ${owners[idx].quantity}   "),
                                            if (ticketsDict.isNotEmpty)
                                              Text(
                                                  "${(owners[idx].quantity / ticketsDict.length * 100).toStringAsFixed(1)}%")
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
                                  shuffledTickets = shuffleTix(ticketsDict);
                                  setState(() {
                                    tixWidgetKey++;
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
                                    Map<int, String> tixDict = shuffledTix
                                        ? shuffledTickets
                                        : ticketsDict;
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
            ),
          ),
        ),
      ),
    );
  }
}
