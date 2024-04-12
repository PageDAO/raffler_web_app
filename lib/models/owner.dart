class Owner {
  final String address;
  final int quantity;
  String? tokenIds;

  Owner({
    required this.address,
    required this.quantity,
    this.tokenIds,
  });
}
