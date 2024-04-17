<p align="center">
  <img src="https://github.com/PageDAO/raffler_web_app/blob/main/ui_screenshot.png" height="350" alt="NFT Raffle Drawing" />
</p>
<p align="center">
  <em>A Web App to Host NFT 🎟️ Drawings</em>
</p>


# Raffler!

A Web3 dApp to randomly select an owner of an NFT.

Requirements:
1. OpenSeaAPIKey

## How to use the web app
1. Input your OpenSea Api key  
2. Add your NFT contract to the NFT list  
3. Press Get Raffle Tix  
    - When you press "Get Raffle Tix", this finds all the holders of the NFT Contract, how many each person has purchased, and returns a list of numbered tickets with the owner's address associated with it.  
4. Shuffle the Tickets  
    - This will shuffle all the tickets around  
5. Draw the winning ticket!!!  
    - Randomly selects a ticket  
    - Returns the owner address with the ticket number from 

## Getting Started
1. Create an NFT for people to purchase. Only NFTs that can be found on OpenSea can be imported at this time.

## (DEV) Getting Started

1. Setup your flutter environment
2. Build application


https://docs.syndicate.io/get-started/introduction

curl -H 'Authorization: Bearer GBZ2s7NJkW6wM82uNw2S' \
 -H "Content-type: application/json" \
  -d '{
  "projectId": "8f00e6f1-1fe9-43a9-92a7-cdba63b7a176",
  "contractAddress": "0x70937D935a4abDaF545E41a32c63c593b32f2a0D",
  "chainId": 666666666,
  "functionSignature": "createWithOpenMint(address owner,string calldata name,string calldata symbol)",
  "args": {
    "owner": "0x276058256ead8cfac715de5130d1b1d8b5cd98fa",
    "name": "Deploy on Degen Workshop: Raffler NFT",
    "symbol": "WINTIX"
  }
 }' \
 'https://api.syndicate.io/transact/sendTransaction'


### Drive
 https://drive.google.com/file/d/1h8ZR_aublQyk7-mUbxtv2P0qskdxoXPQ/view?usp=sharing