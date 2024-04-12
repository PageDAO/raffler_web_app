import 'package:web3dart/web3dart.dart';

class Contract {
  final String abi;
  final String byteCode;
  final String contractAddress;

  Contract({
    required this.abi,
    required this.byteCode,
    required this.contractAddress,
  });

  EthereumAddress toEthAddress() {
    return EthereumAddress.fromHex(contractAddress);
  }
}
