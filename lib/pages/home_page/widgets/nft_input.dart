import 'package:flutter/material.dart';
import 'package:raffle_application/models/NFTContract.dart';
import 'package:raffle_application/pages/home_page/widgets/nft_input_form.dart';

class NFTInput extends StatefulWidget {
  final onOpen;
  final onSubmit;
  const NFTInput({this.onOpen, this.onSubmit, super.key});

  @override
  State<NFTInput> createState() => _NFTInputState();
}

class _NFTInputState extends State<NFTInput> {
  bool nftMenuOpen = false;

  TextEditingController chainIDController = TextEditingController();
  TextEditingController contractAddressController = TextEditingController();
  TextEditingController tokenIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Column(
          children: [
            const Text(""),
            AnimatedContainer(
              duration: const Duration(milliseconds: 390),
              curve: Curves.decelerate,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: nftMenuOpen
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      width: 2)),
              height: 105,
              width: nftMenuOpen ? 225 : 0,
              child: NFTInputForm(
                chainIDController: chainIDController,
                contractAddressController: contractAddressController,
                tokenIDController: tokenIDController,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                tooltip: nftMenuOpen ? "Cancel" : "Add your ticket NFTs",
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(0),
                splashRadius: 28,
                onPressed: () {
                  nftMenuOpen = !nftMenuOpen;
                  setState(() {});
                },
                icon: Icon(nftMenuOpen ? Icons.remove : Icons.add)),
            if (nftMenuOpen)
              IconButton(
                  tooltip: "Submit",
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(0),
                  splashRadius: 28,
                  onPressed: () {
                    nftMenuOpen = !nftMenuOpen;
                    widget.onSubmit(NFT(
                        chain: chainIDController.text,
                        id: tokenIDController.text,
                        address: contractAddressController.text));
                    // widget.onSubmit(NFT(
                    //     chain: "optimism",
                    //     id: "1",
                    //     address:
                    //         '0x464c77eea43f403b9548b61a2ac749cae954c21b'));
                    setState(() {});
                  },
                  icon: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
