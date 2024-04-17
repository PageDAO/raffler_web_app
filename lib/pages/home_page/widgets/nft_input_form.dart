import 'package:flutter/material.dart';

class NFTInputForm extends StatefulWidget {
  final onSubmit;
  final TextEditingController chainIDController;
  final TextEditingController contractAddressController;
  final TextEditingController tokenIDController;
  const NFTInputForm(
      {required this.chainIDController,
      required this.contractAddressController,
      required this.tokenIDController,
      this.onSubmit,
      super.key});

  @override
  State<NFTInputForm> createState() => _NFTInputFormState();
}

class _NFTInputFormState extends State<NFTInputForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _chainIDController;
  late TextEditingController _contractAddressController;
  late TextEditingController _tokenIDController;

  @override
  void initState() {
    super.initState();
    _chainIDController = widget.chainIDController;
    _contractAddressController = widget.contractAddressController;
    _tokenIDController = widget.tokenIDController;
  }

  // @override
  // void dispose() {
  //   _chainIDController.dispose();
  //   _contractAddressController.dispose();
  //   _tokenIDController.dispose();
  //   super.dispose();
  // }

  TextStyle style = const TextStyle(fontSize: 14);
  InputDecoration inputDecoration = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    labelText: 'Chain ID',
    labelStyle: TextStyle(fontSize: 14), // Adjust the font size here
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _chainIDController,
            decoration: inputDecoration,
            style: style,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Chain ID';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            controller: _contractAddressController,
            decoration: inputDecoration.copyWith(labelText: "Contract Address"),
            style: style,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Contract Address';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 2,
          ),
          TextFormField(
            controller: _tokenIDController,
            decoration:
                inputDecoration.copyWith(labelText: "Token ID  (Optional)"),
            style: style,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Token ID';
              }
              return null;
            },
          ),
        ]),
      ),
    );
  }
}
