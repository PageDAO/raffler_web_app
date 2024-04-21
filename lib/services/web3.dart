// import 'package:http/http.dart'; //You can also import the browser version
import 'dart:convert';

import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/contract.dart';
import 'package:Raffler/models/owner.dart';
import 'package:Raffler/models/platform.dart';
import 'package:Raffler/static/blockexplorer_apis.dart';
import 'package:Raffler/static/contracts.dart';
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

Future<NFT?> getNFT(NFT nft, APIOption apiOption, String apiKey) async {
  // get the json response
  Map<String, dynamic>? response =
      await Api().getNftResponse(nft, apiOption, apiKey);
  print(response);
  if (response == null) return null;
  // parse the response based on chain query

  NFT? responseNft = await Api().convertResponseToNFT(nft, apiOption, response);

  return responseNft;
}

Future<List<Owner>?> getHolders(List<NFT> nfts) async {
  List<Owner> owners = [];
  for (NFT nft in nfts) {
    print("Get HOLDERS");
    Map<String, dynamic>? response = await Api().getHoldersResponse(nft);
    if (response == null) return null;
    List<Owner>? responseOwners =
        await Api().convertResponseToHolders(nft, response);
    if (responseOwners == null) return null;
    owners.addAll(responseOwners);
  }
  return owners;
}
