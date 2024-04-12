import 'package:flutter/material.dart';
import 'package:raffle_application/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageDAO Raffle dApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'NFT Ticket Raffle'),
    );
  }
}
