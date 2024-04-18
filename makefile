clean:
	flutter clean
	flutter build web --no-tree-shake-icons

deploy:
	firebase deploy

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
		-d '{"query":"query MyQuery {\n  TokenBalances(\n    input: {\n      filter: {\n        tokenAddress: { _eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\" }\n        tokenId: { _eq: \"1\" }\n      }\n      blockchain: degen\n    }\n  ) {\n    TokenBalance {\n      owner {\n        addresses\n        domains {\n          name\n          isPrimary\n        }\n        socials {\n          dappName\n          profileName\n          userAssociatedAddresses\n        }\n        xmtp {\n          isXMTPEnabled\n        }\n      }\n    }\n  }\n}"}' \


nft:
	curl -X POST \
		--url 'https://api.airstack.xyz/graphql' \
		-H "Content-Type: application/json" \
		--header 'Authorization: bearer 1756e62c0f0b643f1a6537459fccf70f2' \
		-d '{"query":"query MyQuery {\n  TokenNfts(input: {filter: {tokenId: {_eq: \"1\"}, address: {_eq: \"0x8941F686BaADEe7bf5207a3aaC5974D21c462849\"}}, blockchain: degen}) {\n    TokenNft {\n      tokenId\n      address\n      token {\n        address\n        baseURI\n        name\n        logo {\n          small\n          large\n        }\n        totalSupply\n        owner {\n          addresses\n        }\n        chainId\n        blockchain\n        lastTransferBlock\n      }\n    }\n  }\n}"}' \

# query getFields($entity:String,$show_hidden:Boolean) {
#   getFields(entity:$entity,show_hidden:$show_hidden){
#     id
#     name
#     name_label
#     main_type
#     is_required
#     is_visible
#     is_unique
#     default_value
#     catalog_type_id
#     reference_field_id
#     reference_fa_entity_id
#     reference_fa_entity_name
#   }
# }

# curl --location --request POST 'https://freeagent.network/api/graphql' \
# --header 'Authorization: bearer MY_TOKEN' \
# --header 'Content-Type: application/json' \
# --header 'Cookie: hazel=True' \
# --data-raw '{"query":"query listEntityValues($entity: String!, $fields: [String], $order: [[String]], $limit: Int, $offset: Int, $pattern: String, $filters: [Filter]) {\n        listEntityValues(entity: $entity, fields: $fields, order: $order, limit: $limit, offset: $offset, pattern: $pattern, filters: $filters) {\n          count\n          entity_values {\n            id\n            seq_id\n            field_values\n          }\n        }\n      }","variables":{"entity":"product","show_hidden":false}}'