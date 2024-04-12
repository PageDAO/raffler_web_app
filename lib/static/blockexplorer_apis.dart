class Api {
  Map<String, Function> uris = {
    'optimism': (chain, tokenContractAddress, tokenId) =>
        "https://api.opensea.io/api/v2/chain/${chain}/contract/${tokenContractAddress}/nfts/${tokenId}"
  };
}
