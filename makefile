clean:
	flutter clean
	flutter build web --no-tree-shake-icons

deploy:
	flutter clean
	flutter build web --no-tree-shake-icons
	firebase deploy

local:
	flutter clean
	flutter build web --no-tree-shake-icons
	firebase serve --only hosting

t:
	curl -X GET "https://api.opensea.io/api/v2/chain/optimism/contract/0x464c77eea43f403b9548b61a2ac749cae954c21b/nfts/1" \
	-H  "X-API-KEY: <insert_api_key" \
	-H  "Content-Type: application/json" \


l:
	curl -X GET "https://api.opensea.io/api/v2/chain/optimism/contract/0xbcf96c830480cbbb1fa5d24c11f1ab41a01bcdbd/nfts" \
	-H  "X-API-KEY: <insert_api_key" \
	-H  "Content-Type: application/json" \

c:
	curl -X GET "https://api.opensea.io/api/v2/chain/optimism" \
	-H  "X-API-KEY: <insert_api_key" \
	-H  "Content-Type: application/json" \


d:
	curl --request POST \
		--url 'https://api.syndicate.io/token-metadata/bulk/8f00e6f1-1fe9-43a9-92a7/666666666/0x70937D935a4abDaF545E41a32c63c593b32f2a0D?id="default"' \
		--header 'Authorization: Bearer 1756e62c0f0b643f1a6537459fccf70f2' \
		--header 'Content-Type: application/json' \
		--data '{
		"type": "json",
		"content": "https://ipfs.io/ipfs/QmXEKMXTckYcmeQj1vQXqmmpWwu57MRgJcY6xkhqTh181W/",
		"Price": "100 $DEGEN"
		}'


t:
	curl --request POST \
		--url 'https://api.airstack.xyz/graphql' \
		--header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
		-H "Content-Type: application/json" \
		-d '{"query":"query MyQuery { TokenBalances(input: {filter: {tokenAddress: { _eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\" } tokenId: { _eq: \"1\" } } blockchain: degen}) {TokenBalance { owner {addresses domains {name isPrimary } socials { dappName profileName userAssociatedAddresses } xmtp { isXMTPEnabled}}}}}"}' \


nft:
	curl -X POST \
		--url 'https://api.airstack.xyz/graphql' \
		-H "Content-Type: application/json" \
		--header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
		-d '{"query":"query MyQuery {TokenNfts(input: {filter: {}, blockchain: degen}) {TokenNft {address}}"}'