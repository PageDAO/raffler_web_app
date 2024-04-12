clean:
	flutter clean
	flutter build web --no-tree-shake-icons

t:
	curl -X GET "https://api.opensea.io/api/v2/chain/optimism/contract/0x464c77eea43f403b9548b61a2ac749cae954c21b/nfts/1" \
	-H  "X-API-KEY: <insert_api_key" \
	-H  "Content-Type: application/json" \