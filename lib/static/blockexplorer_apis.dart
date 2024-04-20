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
        print("here");
        String uri = 'https://api.airstack.xyz/graphql';
        String contractAddress = "0x8941F686BaADEe7bf5207a3aaC5974D21c462849";
        String jsonString =
            '{ "query" : "query MyQuery { TokenNfts ( input: { filter: { tokenId: ${1}, address: $contractAddress}}, blockchain: ${nft.chain}}) { TokenNft { tokenId address }}"}';
        final response = await http.post(Uri.parse(uri),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'bearer 1756e62c0f0b643f1a6537459fccf70f2'
            },
            body: jsonString);
        print(response.body);
        //   curl -X POST \
        // --url 'https://api.airstack.xyz/graphql' \
        // -H "Content-Type: application/json" \
        // --header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
        // -d '{"query":"query MyQuery {\n  TokenNfts(input: {filter: {tokenId: {_eq: \"1\"}, address: {_eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\"}}, blockchain: degen}) {\n    TokenNft {\n      tokenId\n      address\n      token {\n        address\n        baseURI\n        name\n        logo {\n          small\n          large\n        }\n        totalSupply\n        owner {\n          addresses\n        }\n        chainId\n        blockchain\n        lastTransferBlock\n      }\n    }\n  }\n}"}' \

        // USING THE GRAPHQL METHOD

        // await initHiveForFlutter();

        // final HttpLink httpLink = HttpLink(
        //   'https://api.airstack.xyz/graphql',
        // );

        // final AuthLink authLink = AuthLink(
        //   getToken: () async => 'Bearer 1756e62c0f0b643f1a6537459fccf70f2',
        //   // OR
        //   // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
        // );

        // final Link link = authLink.concat(httpLink);

        // ValueNotifier<GraphQLClient> client = ValueNotifier(
        //   GraphQLClient(
        //     link: link,
        //     // The default store is the InMemoryStore, which does NOT persist to disk
        //     cache: GraphQLCache(store: HiveStore()),
        //   ),
        // );
      }
    }
  }

// query MyQuery
// { TokenNfts (
//   input:
//   { filter:
//   { tokenId: ${1}, address: $contractAddress}
//   }, blockchain: ${nft.chain}
//   )}
//   { TokenNft { tokenId address }}"}
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
    } else if (airstackChains.contains(nft.chain)) {
      //   curl -X POST \
      // --url 'https://api.airstack.xyz/graphql' \
      // -H "Content-Type: application/json" \
      // --header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
      // -d '{"query":"query MyQuery {\n  TokenNfts(input: {filter: {tokenId: {_eq: \"1\"}, address: {_eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\"}}, blockchain: degen}) {\n    TokenNft {\n      tokenId\n      address\n      token {\n        address\n        baseURI\n        name\n        logo {\n          small\n          large\n        }\n        totalSupply\n        owner {\n          addresses\n        }\n        chainId\n        blockchain\n        lastTransferBlock\n      }\n    }\n  }\n}"}' \
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
      } else if (airstackChains.contains(nft.chain)) {
        //   curl -X POST \
        // --url 'https://api.airstack.xyz/graphql' \
        // -H "Content-Type: application/json" \
        // --header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
        // -d '{"query":"query MyQuery {\n  TokenNfts(input: {filter: {tokenId: {_eq: \"1\"}, address: {_eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\"}}, blockchain: degen}) {\n    TokenNft {\n      tokenId\n      address\n      token {\n        address\n        baseURI\n        name\n        logo {\n          small\n          large\n        }\n        totalSupply\n        owner {\n          addresses\n        }\n        chainId\n        blockchain\n        lastTransferBlock\n      }\n    }\n  }\n}"}' \
      } else {
        throw ArgumentError('Unsupported chain: ${nft.chain}');
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
    } else if (airstackChains.contains(nft.chain)) {
      //   curl -X POST \
      // --url 'https://api.airstack.xyz/graphql' \
      // -H "Content-Type: application/json" \
      // --header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
      // -d '{"query":"query MyQuery {\n  TokenNfts(input: {filter: {tokenId: {_eq: \"1\"}, address: {_eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\"}}, blockchain: degen}) {\n    TokenNft {\n      tokenId\n      address\n      token {\n        address\n        baseURI\n        name\n        logo {\n          small\n          large\n        }\n        totalSupply\n        owner {\n          addresses\n        }\n        chainId\n        blockchain\n        lastTransferBlock\n      }\n    }\n  }\n}"}' \
    } else {
      throw ArgumentError('Unsupported chain: ${nft.chain}');
    }
  }
}
