// import 'package:http/http.dart'; //You can also import the browser version
import 'dart:convert';

import 'package:raffle_application/models/contract.dart';
import 'package:raffle_application/models/owner.dart';
import 'package:raffle_application/static/contracts.dart';
import 'package:web3dart/web3dart.dart';

import 'package:http/http.dart' as http;

// Walkthrough docs: https://web3auth.io/docs/connect-blockchain/evm/optimism/flutter

Future<void> fetchContract() async {
  var rpcUrl = "https://mainnet.optimism.io"; //Replace with your API

  // read from contract
  Web3Client client = Web3Client(rpcUrl, http.Client());

  Contract testContract = Contracts().raffleTicket;
  final contract = DeployedContract(
      ContractAbi.fromJson(testContract.abi, ''), testContract.toEthAddress());
  final messageFunction = contract.function('nextTokenId');
  var message;

  try {
    message = await client
        .call(contract: contract, function: messageFunction, params: []);
  } catch (e) {
    message = "error";
    print(e.toString());
  }
  print(message.runtimeType);
  print("Contract Read Message, $message");
}

// https://docs.opensea.io/reference/openapi-definition

Future<List<Owner>?> fetchNFTHolders() async {
  String tokenContractAddress = '0x464c77eea43f403b9548b61a2ac749cae954c21b';
  String tokenId = "1";
  String openSeaApiKey = <insert_opensea_apikey>;
  String chain = "optimism";

  try {
    // final response =
    //     await http.get(Uri.parse("https://api.opensea.io/api/v1/health"));
    final response = await http.get(
        Uri.parse(
            "https://api.opensea.io/api/v2/chain/${chain}/contract/${tokenContractAddress}/nfts/${tokenId}"),
        headers: {
          'Content-Type': 'application/json',
          'X-API-KEY': openSeaApiKey
        });

    if (response.statusCode == 200) {
      var responseBody = response.body;
      Map<String, dynamic> holders = json.decode(responseBody);
      List<Owner> owners = [];
      for (var ownerData in holders['nft']['owners']) {
        owners.add(Owner(
          address: ownerData['address'],
          quantity: ownerData['quantity'],
        ));
      }
      return owners;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  } catch (e) {
    print(e.toString());
    return null;
  }
}
