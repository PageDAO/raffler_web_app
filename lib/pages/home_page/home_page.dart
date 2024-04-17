import 'package:Raffler/pages/home_page/widgets/alert_dialog.dart';
import 'package:Raffler/services/url_launch.dart';
import 'package:Raffler/shared/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/owner.dart';
import 'package:Raffler/pages/home_page/widgets/nft_input_form.dart';
import 'package:Raffler/services/string_functs.dart';
import 'package:Raffler/services/tickets.dart';
import 'package:Raffler/services/web3.dart';

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
  List<Owner> winners = [];

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
                        height: 25,
                      ),
                      if (winners.isNotEmpty)
                        SizedBox(
                          height: 20,
                          child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 24,
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List<Widget>.generate(
                                    winners.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        winners[index].address,
                                        style: const TextStyle(
                                            color: Color(0xff33FFD3)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      if (winners.isEmpty)
                        const SizedBox(
                          height: 20,
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        tooltip: "Add your ticket NFTs",
                                        constraints: const BoxConstraints(),
                                        padding: const EdgeInsets.all(0),
                                        splashRadius: 28,
                                        onPressed: () async {
                                          if (apiKeyController.text.isEmpty) {
                                            showToast(
                                                "Input your OpenSea API Key",
                                                context);
                                          }
                                          if (apiKeyController
                                              .text.isNotEmpty) {
                                            await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Web3AlertDialog(
                                                  title: 'Add NFT Contract',
                                                  content: SizedBox(
                                                    height: 99,
                                                    child: NFTInputForm(
                                                      chainIDController:
                                                          chainIDController,
                                                      contractAddressController:
                                                          contractAddressController,
                                                      tokenIDController:
                                                          tokenIDController,
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        // get the nft information, then add it to the
                                                        if (apiKeyController
                                                            .text.isNotEmpty) {
                                                          NFT submittedNFT = NFT(
                                                              chain:
                                                                  chainIDController
                                                                      .text,
                                                              id: tokenIDController
                                                                  .text,
                                                              address:
                                                                  contractAddressController
                                                                      .text);
                                                          NFT? nft = await getNFT(
                                                              submittedNFT,
                                                              apiKeyController
                                                                  .text);
                                                          if (nft == null) {
                                                            showToast(
                                                                "NFT Not Found",
                                                                context);
                                                          } else {
                                                            Navigator.pop(
                                                                context, true);

                                                            nfts.add(nft);

                                                            // clear the text editing controllers
                                                            chainIDController
                                                                .clear();
                                                            contractAddressController
                                                                .clear();
                                                            tokenIDController
                                                                .clear();

                                                            setState(() {});
                                                          }
                                                        }
                                                      },
                                                      child: const Text('Add'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        icon: const Icon(Icons.add)),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              width: 225,
                              height: 75,
                              constraints: const BoxConstraints(
                                  minHeight: 75, maxHeight: 205),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2)),
                              padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
                              child: ListView.builder(
                                itemCount: nfts.length,
                                shrinkWrap: true,
                                itemExtent: 25,
                                itemBuilder: (context, idx) {
                                  NFT nft = nfts[idx];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            // Text("$idx. "),
                                            Text(nft.chain.substring(0, 4)),
                                            // Failed Attempt to render IPFS image. Fails with error:
                                            // nft.imageUrl != null
                                            //     ? Builder(builder: (context) {
                                            //         print(
                                            //             "Loading the NFTs, image URL: ${nft.imageUrl}");
                                            //         return Image.network(
                                            //           nft.imageUrl!,
                                            //           width: 20,
                                            //           height: 20,
                                            //         );
                                            //       })
                                            //     : Container(
                                            //         width: 14,
                                            //       ),
                                            const Text("   "),
                                            Text(formatAddress(nft.address)),
                                            const Text("   "),
                                            Tooltip(
                                              message: "View in OpenSea",
                                              child: InkWell(
                                                onTap: () async {
                                                  if (nft.openseaUrl != null) {
                                                    await launchURL(
                                                        nft.openseaUrl);
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.launch,
                                                  size: 20,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(child: Container()),
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
                          // add winner address to winners owner's list
                          Owner winningTicketOwner = owners
                              .where((element) =>
                                  element.address == winningTicket!.value)
                              .toList()
                              .first;
                          winners.add(winningTicketOwner);
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
                            Text(
                              "Ticket #: ${winningTicket!.key}",
                              style: const TextStyle(
                                  color: Color(0xff33FFD3), fontSize: 20),
                            ),
                            Text(
                              "Owner Address: ${winningTicket!.value}",
                              style: const TextStyle(
                                  color: Color(0xff33FFD3), fontSize: 20),
                            ),
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
                                    showToast(
                                        "Input your OpenSea API Key", context);
                                  }
                                  if (nfts.isEmpty) {
                                    showToast("Add your NFT", context);
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
                                child: const Text("Get Owners!!!"),
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
                                      onTap: null,
                                      //  () {
                                      // print(
                                      //     "see owner ${owners[idx].address}");
                                      // },
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
