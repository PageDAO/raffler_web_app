class Api {
  Map<String, Function> nftUrisByContract = {
    'optimism': (chain, tokenContractAddress) =>
        "https://api.opensea.io/api/v2/chain/${chain}/contract/${tokenContractAddress}/nfts"
  };
  Map<String, Function> nftUrisByTokenId = {
    'optimism': (chain, tokenContractAddress, tokenId) =>
        "https://api.opensea.io/api/v2/chain/${chain}/contract/${tokenContractAddress}/nfts/${tokenId}"
  };
}
