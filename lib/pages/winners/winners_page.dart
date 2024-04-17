import 'package:Raffler/models/owner.dart';
import 'package:Raffler/services/string_functs.dart';
import 'package:flutter/material.dart';

// csv packages
import 'dart:html' as html;
import 'package:csv/csv.dart';

class WinnersPage extends StatefulWidget {
  final List<Owner> winnersList;
  const WinnersPage({required this.winnersList, super.key});

  @override
  State<WinnersPage> createState() => _WinnersPageState();
}

class _WinnersPageState extends State<WinnersPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                if (widget.winnersList.isNotEmpty) {
                  List<List<String>> data = [];
                  int idx = 1;
                  widget.winnersList.forEach((element) {
                    data.add(["$idx", element.address]);
                    idx += 1;
                  });

                  String csv = const ListToCsvConverter().convert(data);
                  final link = html.AnchorElement(
                      href: "data:text/csv;charset=utf-8,$csv")
                    ..setAttribute("download", "raffler_winners.csv")
                    ..click();

                  // Append the link to the body
                  html.document.body!.children.add(link);
                }
              },
              child: const Text("To Csv"),
            ),
            const SizedBox(
              height: 8,
            ),
            // ElevatedButton(
            //   onPressed: () async {},
            //   child: const Text("to Json"),
            // ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          children: [
            const Text("Winners"),
            SizedBox(
              width: 180,
              child: ListView.builder(
                itemCount: widget.winnersList.length,
                shrinkWrap: true,
                itemExtent: 28,
                itemBuilder: (context, idx) {
                  Owner owner = widget.winnersList[idx];
                  String ownerAddress = owner.address;
                  return Center(
                    child: Text("${idx + 1}:   ${formatAddress(ownerAddress)}",
                        style: const TextStyle(color: Color(0xff33FFD3))),
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
