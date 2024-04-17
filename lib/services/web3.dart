// import 'package:http/http.dart'; //You can also import the browser version
import 'dart:convert';

import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/contract.dart';
import 'package:Raffler/models/owner.dart';
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

Future<NFT?> getNFT(NFT nft, String openSeaApiKey) async {
  // print(address!(chain, tokenContractAddress, tokenId));
  Map<dynamic, dynamic>? _nft;
  if (nft.id.isEmpty) {
    print("is empty");
    Function? address = Api().nftUrisByContract["optimism"];
    String nftUri = address!(nft.chain, nft.address);
    try {
      final response = await http.get(Uri.parse(nftUri), headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': openSeaApiKey
      });

      if (response.statusCode == 200) {
        var responseBody = response.body;
        Map<String, dynamic> nftResponse = json.decode(responseBody);
        // RETURN MORE NFT INFORMATION
        print(nftResponse['nfts']);
        _nft = nftResponse['nfts'].first;
        print(_nft);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  } else {
    print("is ${nft.id}");
    Function? address = Api().nftUrisByTokenId["optimism"];
    String nftUri = address!(nft.chain, nft.address, nft.id);
    try {
      final response = await http.get(Uri.parse(nftUri), headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': openSeaApiKey
      });

      if (response.statusCode == 200) {
        var responseBody = response.body;
        Map<String, dynamic> nftResponse = json.decode(responseBody);
        // RETURN MORE NFT INFORMATION
        print(nftResponse);
        print(nftResponse['nft']);
        _nft = nftResponse['nft'];
        print(_nft);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  NFT responseNFT = NFT(
    address: _nft!['contract'],
    chain: nft.chain,
    id: nft.id.isEmpty ? _nft['identifier'] : nft.id,
    tokenStandard: _nft['token_standard'],
    name: _nft['name'],
    description: _nft['description'],
    imageUrl: _nft['image_url'],
    openseaUrl: _nft['opensea_url'],
    updatedAt: _nft['updated_at'],
    isDisabled: _nft['is_disabled'],
    isNSFW: _nft['is_nsfw'],
  );
  return responseNFT;
}

Future<List<Owner>?> fetchNFTHolders(
    List<NFT> nfts, String openSeaApiKey) async {
  Function? address = Api().nftUrisByTokenId["optimism"];
  List<Owner> owners = [];
  for (NFT nft in nfts) {
    // print(address!(chain, tokenContractAddress, tokenId));
    String nftUri = address!(nft.chain, nft.address, nft.id);
    try {
      final response = await http.get(Uri.parse(nftUri), headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': openSeaApiKey
      });

      if (response.statusCode == 200) {
        var responseBody = response.body;
        Map<String, dynamic> holders = json.decode(responseBody);
        // RETURN MORE NFT INFORMATION

        // RETURN LIST OF OWNERS
        for (var ownerData in holders['nft']['owners']) {
          owners.add(Owner(
            address: ownerData['address'],
            quantity: ownerData['quantity'],
          ));
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
        print(response.body);
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  return owners;
}

void debugPrint(String s) {}
