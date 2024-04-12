import 'dart:math';

import 'package:raffle_application/models/owner.dart';

Map<int, String> buildTixDict(List<Owner> owners) {
  Map<int, String> ticketsDict = {};
  int lastKey = 1;

  for (var owner in owners) {
    for (var i = 0; i < owner.quantity; i++) {
      ticketsDict[lastKey] = owner.address;
      lastKey += 1;
    }
  }
  return ticketsDict;
}

Map<int, String> shuffleTix(Map<int, String> ticketsDict) {
  Map<int, String> shuffledTickets = {};
  List<String> values = ticketsDict.values.toList();
  values.shuffle();

  int index = 0;
  ticketsDict.forEach((key, _) {
    shuffledTickets[key] = values[index];
    index++;
  });

  return shuffledTickets;
}

MapEntry<int, String> drawTicket(Map<int, String> tixDict) {
  Random random = Random();
  List<MapEntry<int, String>> entries = tixDict.entries.toList();

  // Select a random entry
  MapEntry<int, String> randomEntry = entries[random.nextInt(entries.length)];
  print('Random key: ${randomEntry.key}, Value: ${randomEntry.value}');
  return randomEntry;
}
