import 'dart:convert';

import 'package:Raffler/models/NFTContract.dart';
import 'package:Raffler/models/owner.dart';
import 'package:Raffler/models/platform.dart';

import 'package:http/http.dart' as http;

class Api {
  List<String> openSeaChains = [
    'amoy',
    'arbitrum',
    'arbitrum_nova',
    'arbitrum_sepolia',
    'avalanche',
    'avalanche_fuji',
    'baobab',
    'base',
    'base_sepolia',
    'blast',
    'blast_sepolia',
    'bsc',
    'bsctestnet',
    'ethereum',
    'klaytn',
    'matic',
    'mumbai',
    'optimism',
    'optimism_sepolia',
    'sepolia',
    'solana',
    'soldev',
    'zora',
    'zora_sepolia'
  ];

  List<String> airstackChains = ['ethereum', 'base', 'zora', 'gold', 'degen'];

  Future<Map<String, dynamic>?> makeOpenSeaRequest(
      String uri, String openSeaApiKey) async {
    try {
      final response = await http.get(Uri.parse(uri), headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': openSeaApiKey
      });

      if (response.statusCode == 200) {
        var responseBody = response.body;
        Map<String, dynamic> nftResponse = json.decode(responseBody);
        // RETURN MORE NFT INFORMATION
        return nftResponse;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> getNftResponse(
      NFT nft, APIOption apiOption, String apiKey) async {
    Map<dynamic, dynamic>? _nft;
    if (apiOption == APIOption.openSea) {
      if (openSeaChains.contains(nft.chain)) {
        String nftUri = nft.id.isEmpty
            ? "https://api.opensea.io/api/v2/chain/${nft.chain}/contract/${nft.address}/nfts"
            : "https://api.opensea.io/api/v2/chain/${nft.chain}/contract/${nft.address}/nfts/${nft.id}";

        Map<String, dynamic>? response =
            await makeOpenSeaRequest(nftUri, apiKey);
        return response;
      } else {
        throw ArgumentError('Unsupported chain: ${nft.chain}');
      }
    } else if (apiOption == APIOption.airStack) {
      if (airstackChains.contains(nft.chain)) {
        String uri = 'https://api.airstack.xyz/graphql';

        String jsonString = jsonEncode({
          "query":
              "query MyQuery {TokenNfts(input: {filter: {tokenId: {_eq: \"${nft.id}\"}, address: {_eq: \"${nft.address}\"}}, blockchain: ${nft.chain}}) {TokenNft {tokenId address token {address baseURI name logo { small large} totalSupply owner { addresses } chainId blockchain lastTransferBlock }}}}",
        });

        final response = await http.post(Uri.parse(uri),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${nft.apiKey}'
            },
            body: jsonString);
        var responseBody = response.body;
        Map<String, dynamic> nftResponse = json.decode(responseBody);
        // RETURN MORE NFT INFORMATION
        return nftResponse;
      }
    }
  }

  Future<NFT?> convertResponseToNFT(
      NFT nft, APIOption apiOption, Map<String, dynamic> response) async {
    Map<dynamic, dynamic>? _nft;
    if (apiOption == APIOption.openSea) {
      if (openSeaChains.contains(nft.chain)) {
        if (nft.id.isEmpty) {
          _nft = response['nfts'].first;
        } else {
          _nft = response['nft'];
        }
        NFT responseNFT = NFT(
          apiOption: apiOption,
          apiKey: nft.apiKey,
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
      } else {
        throw ArgumentError("Chain not available on OpenSea");
      }
    } else if (apiOption == APIOption.airStack) {
      _nft = response['data']['TokenNfts']['TokenNft'].first;

      NFT responseNFT = NFT(
        apiOption: apiOption,
        apiKey: nft.apiKey,
        address: _nft!['address'],
        chain: nft.chain,
        id: nft.id.isEmpty ? _nft['tokenId'] : nft.id,
        name: _nft['token']['name'],
        totalSupply: int.parse(_nft['token']['totalSupply']),
        imageUrl: _nft['token']['logo']['small'],
      );
      return responseNFT;
    } else {
      throw ArgumentError('Unsupported chain: ${nft.chain}');
    }
  }

  // HOLDERS

  Future<Map<String, dynamic>?> getHoldersResponse(NFT nft) async {
    if (nft.apiOption == APIOption.openSea) {
      if (openSeaChains.contains(nft.chain)) {
        String nftUri =
            "https://api.opensea.io/api/v2/chain/${nft.chain}/contract/${nft.address}/nfts/${nft.id}";

        Map<String, dynamic>? response =
            await makeOpenSeaRequest(nftUri, nft.apiKey);
        return response;
      } else {
        throw ArgumentError('Unsupported chain: ${nft.chain}');
      }
    } else if (airstackChains.contains(nft.chain)) {
      if (nft.apiOption == APIOption.airStack) {
        // get the total supply

        int totalSupply = nft.totalSupply ?? 200;

        int batchSize = 200;

        String uri = 'https://api.airstack.xyz/graphql';

        Map<String, dynamic> allResponses = {};

        for (int i = 1; i < totalSupply; i += batchSize) {
          int start = i;
          int end =
              (i + batchSize <= totalSupply) ? i + batchSize : totalSupply;

          // print('Fetching items from $start to $end');

          // Your fetching logic here
          String jsonString = jsonEncode({
            "query":
                "query MyQuery { TokenBalances(input: {filter: {tokenAddress: { _in: \"${nft.address}\" }, tokenId: {_gte: \"$start\", _lte: \"$end\",}} blockchain: ${nft.chain} limit: 200}) {TokenBalance { tokenId owner {addresses}}}}",
          });

          final response = await http.post(Uri.parse(uri),
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${nft.apiKey}'
              },
              body: jsonString);
          var responseBody = response.body;

          if (allResponses.isEmpty) {
            allResponses = json.decode(responseBody);
          } else {
            // add the results into the totals dictionary
            Map<String, dynamic> nftResponse = json.decode(responseBody);
            allResponses['data']['TokenBalances']["TokenBalance"]
                .addAll(nftResponse['data']['TokenBalances']["TokenBalance"]);
          }
        }
        return allResponses;
      }
    }
  }

  Future<List<Owner>?> convertResponseToHolders(
      NFT nft, Map<String, dynamic> response) async {
    List<Owner> owners = [];
    if (nft.apiOption == APIOption.openSea) {
      if (openSeaChains.contains(nft.chain)) {
        for (var ownerData in response['nft']['owners']) {
          owners.add(Owner(
            address: ownerData['address'],
            quantity: ownerData['quantity'],
          ));
        }
        return owners;
      } else {
        throw ArgumentError("Chain not available on OpenSea");
      }
    } else if (nft.apiOption == APIOption.airStack) {
      if (airstackChains.contains(nft.chain)) {
        // print(response);
        Map<String, dynamic> ownersMap = {};
        for (var ownerData in response['data']['TokenBalances']
            ["TokenBalance"]) {
          ownersMap[ownerData['tokenId']] = ownerData['owner']['addresses']
              .first; // this gets the first owner address of a list. It looks like there can be multiple assigned to an NFT
        }

        Map<String, dynamic> ownershipCount = {};

        ownersMap.entries.forEach((owner) {
          if (ownershipCount.containsKey(owner.value)) {
            ownershipCount[owner.value] += 1;
          } else {
            ownershipCount[owner.value] = 1;
          }
        });

        ownershipCount.entries.forEach((owner) {
          owners.add(Owner(
            address: owner.key,
            quantity: owner.value,
          ));
        });
        return owners;
      }
    } else {
      throw ArgumentError('Unsupported chain: ${nft.chain}');
    }
  }
}
