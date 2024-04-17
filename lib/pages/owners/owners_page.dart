import 'package:flutter/material.dart';
import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/owner.dart';
import 'package:Raffler/services/string_functs.dart';

import 'dart:html' as html;
import 'package:csv/csv.dart';

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

  TextStyle green = const TextStyle(color: Color(0xff33FFD3));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                widget.onGetOwners();
              },
              child: const Text("Get Owners!"),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                if (widget.owners.isNotEmpty) {
                  List<List<String>> data = [];
                  int idx = 1;
                  widget.owners.forEach((element) {
                    data.add(["$idx", element.address]);
                    idx += 1;
                  });

                  String csv = const ListToCsvConverter().convert(data);
                  final link = html.AnchorElement(
                      href: "data:text/csv;charset=utf-8,$csv")
                    ..setAttribute("download", "raffler_owners.csv")
                    ..click();

                  // Append the link to the body
                  html.document.body!.children.add(link);
                }
              },
              child: const Text("To Csv"),
            ),
          ],
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
                          Text(formatAddress(widget.owners[idx].address),
                              style: green),
                          Text("   Tix: ${widget.owners[idx].quantity}   ",
                              style: green),
                          if (widget.ticketsDict.isNotEmpty)
                            Text(
                                "${(widget.owners[idx].quantity / widget.ticketsDict.length * 100).toStringAsFixed(1)}%",
                                style: green)
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
