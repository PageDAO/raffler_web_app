import 'package:Raffler/services/string_functs.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatefulWidget {
  final Map<int, String> ticketsDict;
  final onTicketShuffle;
  const TicketsPage(
      {required this.ticketsDict, this.onTicketShuffle, super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  int tixWidgetKey = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            widget.onTicketShuffle();
            setState(() {
              tixWidgetKey++;
            });
          },
          child: const Text("Shuffle!"),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            const Text("Tickets"),
            SizedBox(
              key: Key("$tixWidgetKey"),
              width: 180,
              child: ListView.builder(
                itemCount: widget.ticketsDict.length,
                shrinkWrap: true,
                itemExtent: 28,
                itemBuilder: (context, idx) {
                  Map<int, String> tixDict = widget.ticketsDict;
                  int ticketNum = tixDict.keys.toList()[idx];
                  String ownerAddress = tixDict[ticketNum]!;
                  return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text("$ticketNum:   ${formatAddress(ownerAddress)}"),
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
