import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/owner.dart';
import 'package:Raffler/services/string_functs.dart';
import 'package:flutter/material.dart';

class OwnersPage extends StatefulWidget {
  final apiKeyController;
  final List<NFT> nfts;
  final List<Owner> owners;
  final Map<int, String> ticketsDict;
  final onGetOwners;
  const OwnersPage(
      {this.apiKeyController,
      required this.nfts,
      required this.owners,
      required this.ticketsDict,
      required this.onGetOwners,
      super.key});

  @override
  State<OwnersPage> createState() => _OwnersPageState();
}

class _OwnersPageState extends State<OwnersPage> {
  bool fetchedOwnersList = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () async {
            widget.onGetOwners();
          },
          child: const Text("Get Owners!"),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          children: [
            const Text("Owners"),
            SizedBox(
              // height: 500,
              width: 210,
              child: ListView.builder(
                itemCount: widget.owners.length,
                shrinkWrap: true,
                itemExtent: 35,
                itemBuilder: (context, idx) {
                  return InkWell(
                    onTap: null,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Row(
                        children: [
                          Text(formatAddress(widget.owners[idx].address)),
                          Text("   Tix: ${widget.owners[idx].quantity}   "),
                          if (widget.ticketsDict.isNotEmpty)
                            Text(
                                "${(widget.owners[idx].quantity / widget.ticketsDict.length * 100).toStringAsFixed(1)}%")
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
