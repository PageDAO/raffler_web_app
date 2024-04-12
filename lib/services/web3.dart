// import 'package:http/http.dart'; //You can also import the browser version
import 'dart:convert';

import 'package:raffle_application/models/contract.dart';
import 'package:raffle_application/models/owner.dart';
import 'package:raffle_application/static/contracts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



import 'package:http/http.dart' as http;

// Walkthrough docs: https://web3auth.io/docs/connect-blockchain/evm/optimism/flutter

Future<void> fetchContract() async {
  await dotenv.load(fileName: ".env");
  String rpcUrl = dotenv.env['RPC_URL'] ?? "https://mainnet.optimism.io";
  
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
  String tokenContractAddress = dotenv.env['TOKEN_CONTRACT_ADDRESS'] ?? 'default_contract_address';
  String tokenId = dotenv.env['TOKEN_ID'] ?? 'default_token_id';
  String openSeaApiKey = dotenv.env['OPEN_SEA_API_KEY'] ?? 'default_api_key';
  String chain = dotenv.env['CHAIN'] ?? 'default_chain';

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
