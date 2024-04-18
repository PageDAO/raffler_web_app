import 'package:Raffler/models/platform.dart';

class NFT {
  final APIOption apiOption;
  final String apiKey;
  final String chain;
  final String id;
  final String address;
  final String? tokenStandard;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? openseaUrl;
  final String? updatedAt;
  final bool isDisabled;
  final bool isNSFW;

  NFT(
      {required this.apiOption,
      required this.apiKey,
      required this.chain,
      required this.id,
      required this.address,
      this.tokenStandard,
      this.name,
      this.description,
      this.imageUrl,
      this.openseaUrl,
      this.updatedAt,
      this.isDisabled = false,
      this.isNSFW = false});
}
