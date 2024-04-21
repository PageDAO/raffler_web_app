import 'package:Raffler/models/contract.dart';
import 'package:Raffler/static/contracts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/web3dart.dart';
import '../../jsPackages/metamask.dart';

class MintPage extends StatefulWidget {
  const MintPage({super.key});

  @override
  State<MintPage> createState() => _MintPageState();
}

class _MintPageState extends State<MintPage> {
  bool fetchedOwnersList = false;
  TextEditingController walletController = TextEditingController();

  TextStyle green = const TextStyle(color: Color(0xff33FFD3));

  // ValueNotifier<MetaMask> metamask = ValueNotifier(MetaMask());

  @override
  void initState() {
    // TODO: this metamask value should get moved to the parent home state
    // (cont'd) so the value doesn't get eliminated when the user changes
    // (cont'd) screen and the user has to reconnec ttheir wallet
    // metamask = Provider.of<ValueNotifier<MetaMask>>(context, listen: false);
    super.initState();
  }

  var metamask = MetaMask();

  Future<bool> _loginWithMetaMask() async {
    bool success = await metamask.login();

    if (success) {
      debugPrint('MetaMask address: ${metamask.address}');
      debugPrint('MetaMask signature: ${metamask.signature}');
      debugPrint('MetaMask network: ${metamask.network}');
    } else {
      debugPrint('MetaMask login failed');
    }
    setState(() {});
    return success;
  }

  int numberToMint = 1;

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              height: 200,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: const Color.fromARGB(255, 76, 76, 76),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        onTap: () async {
                          bool success = await _loginWithMetaMask();
                          if (success) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: SizedBox(
                          // height: 160,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 28,
                              ),
                              SvgPicture.asset(
                                'assets/metamask_logo.svg',
                                // fit: BoxFit.fill,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'MetaMask',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Connect your MetaMask Wallet',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Minting abilities\ncoming soon!"),
            const SizedBox(
              width: 14,
            ),
            SelectionContainer.disabled(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 14.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            // color: themeMode.value.name == "light"
                            //     ? Colors.black54
                            //     : Colors.white,
                            width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35))),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {
                        openDialog(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 13),
                        child: Row(
                          children: [
                            if (metamask.address != null)
                              Row(
                                children: [
                                  Tooltip(
                                    message: "Copy to Clipboard",
                                    child: InkWell(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(
                                              text: metamask.address!));
                                        },
                                        child: const Icon(
                                          Icons.copy,
                                          size: 16,
                                          // color: themeMode.value.name == "light"
                                          //     ? Colors.black
                                          //     : Colors.white,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 80),
                                      child: Text(
                                        '${metamask.address}',
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ],
                              ),
                            if (metamask.address == null)
                              Text(
                                "Connect Wallet",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () async {
        //         // widget.onGetOwners();
        //       },
        //       child: const Text("Degen"),
        //     ),
        //     const SizedBox(
        //       width: 12,
        //     ),
        //     const ElevatedButton(
        //       onPressed: null,
        //       // onPressed: () async {
        //       //   // widget.onGetOwners();
        //       // },
        //       child: Text("Optimism",
        //           style: TextStyle(
        //               color: Colors.grey,
        //               decoration: TextDecoration.lineThrough)),
        //     ),
        //     const SizedBox(
        //       width: 12,
        //     ),
        //     const ElevatedButton(
        //       onPressed: null,
        //       // () async {
        //       //   // widget.onGetOwners();
        //       // },
        //       child: Text("Base",
        //           style: TextStyle(
        //               color: Colors.grey,
        //               decoration: TextDecoration.lineThrough)),
        //     ),
        //   ],
        // ),
        Container(
          height: .6,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 14,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 420),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("PageDAO Raffle NFT"),
            Row(
              children: [
                InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    onTap: () {
                      // decrement
                      if (numberToMint > 0) {
                        setState(() {
                          numberToMint--;
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    )),
                const SizedBox(
                  width: 2,
                ),
                SizedBox(
                    width: 20, child: Center(child: Text("$numberToMint"))),
                const SizedBox(
                  width: 2,
                ),
                InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    onTap: () {
                      // increment
                      if (numberToMint < 99) {
                        setState(() {
                          numberToMint++;
                        });
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: metamask.address != null
                      ? () async {
                          print("Mint");
                          print(metamask.address);
                          print(metamask.signature);
                          print(metamask.network);
                          if (metamask.address != null) {
                            var apiUrl = "https://rpc.degen.tips";
                            // "https://rpc-mainnet.syndicate.io"; //Replace with your API
                            // "https://api.syndicate.io"
                            // var httpClient = Client();
                            // var ethClient = Web3Client(apiUrl, httpClient);

                            // var credentials =
                            //     EthPrivateKey.fromHex(metamask.address!);

                            // print("here");
                            // var address = credentials.address;
                            // print(address);
                            // You can now call rpc methods. This one will query the amount of Ether you own
                            // EtherAmount balance =
                            //     await ethClient.getBalance(address);
                            // print(balance.getInEther);
                            // print(balance.getValueInUnit(EtherUnit.ether));
                            // await ethClient.sendTransaction(
                            //   credentials,
                            //   Transaction(
                            //     to: EthereumAddress.fromHex(
                            //         '0x8e90d60f61ce4503e8ba382175635b446ef62512'),
                            //     gasPrice: EtherAmount.inWei(BigInt.one),
                            //     maxGas: 100000,
                            //     value: EtherAmount.fromUnitAndValue(
                            //         EtherUnit.ether, 1),
                            //   ),
                            // );

                            var rpcUrl =
                                "https://mainnet.optimism.io"; //Replace with your API

                            // read from contract
                            var httpClient = Client();
                            var client = Web3Client(apiUrl, httpClient);

                            // Getting Your Balance
                            EthPrivateKey credentials =
                                EthPrivateKey.fromHex(metamask.address!);
                            EthereumAddress address =
                                credentials.address; // Your Address Object
                            EtherAmount balance = await client
                                .getBalance(address); // Your Balance Object
                            double balanceInNativeCurrency =
                                balance.getValueInUnit(EtherUnit
                                    .ether); // your balance in native currency unit
                            print(balanceInNativeCurrency);

                            // FIRST TEST
                            // Contract atestContract =
                            //     Contracts().pageDAOTicketNFTContract;
                            // final acontract = DeployedContract(
                            //     ContractAbi.fromJson(atestContract.abi, ''),
                            //     atestContract.toEthAddress());
                            // ContractFunction amessageFunction =
                            //     acontract.function('currentTokenId');
                            // var amessage;

                            // try {
                            //   amessage = await client.call(
                            //       contract: acontract,
                            //       function: amessageFunction,
                            //       params: []);
                            // } catch (e) {
                            //   amessage = "error";
                            //   print(e.toString());
                            // }
                            // print(amessage.runtimeType);
                            // print("Contract Read Message, $amessage");
                            Contract testContract =
                                Contracts().pageDAOTicketNFTContract;
                            final contract = DeployedContract(
                                ContractAbi.fromJson(testContract.abi, ''),
                                testContract.toEthAddress());
                            ContractFunction messageFunction =
                                contract.function('mintFree');
                            await client.sendTransaction(
                              credentials,
                              Transaction.callContract(
                                contract: contract,
                                function: messageFunction,
                                parameters: [],
                              ),
                            );

                            // SECOND TEST

                            print("here");
                            // Contract testContract =
                            //     Contracts().pageDAOTicketNFTContract;
                            // final contract = DeployedContract(
                            //     ContractAbi.fromJson(testContract.abi, ''),
                            //     testContract.toEthAddress());
                            // ContractFunction messageFunction =
                            //     contract.function('mintFree');
                            // var message;
                            // print(EthereumAddress.fromHex(metamask.address!));
                            // print("her1");
                            // try {
                            //   message = await client.call(
                            //       contract: contract,
                            //       function: messageFunction,
                            //       params: [
                            //         EthereumAddress.fromHex(metamask.address!)
                            //       ]);
                            // } catch (e) {
                            //   message = "error";
                            //   print(e.toString());
                            // }
                            // print(message.runtimeType);
                            // print("Contract Read Message, $message");
                          }
                        }
                      : null,
                  child: const Text("Mint"),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
