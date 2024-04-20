import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
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

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              height: 165,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white24,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                height: 15,
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
                              const Text(
                                "Connect Wallet",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // widget.onGetOwners();
              },
              child: const Text("Degen"),
            ),
            const SizedBox(
              width: 12,
            ),
            const ElevatedButton(
              onPressed: null,
              // onPressed: () async {
              //   // widget.onGetOwners();
              // },
              child: Text("Optimism",
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)),
            ),
            const SizedBox(
              width: 12,
            ),
            const ElevatedButton(
              onPressed: null,
              // () async {
              //   // widget.onGetOwners();
              // },
              child: Text("Base",
                  style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)),
            ),
          ],
        ),
      ],
    );
  }
}
