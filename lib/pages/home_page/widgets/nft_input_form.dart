import 'package:Raffler/models/platform.dart';
import 'package:flutter/material.dart';

class NFTInputForm extends StatefulWidget {
  final onSubmit;
  final TextEditingController chainIDController;
  final TextEditingController contractAddressController;
  final TextEditingController tokenIDController;
  final TextEditingController apiKeyController;
  final APIOption intiSelectedPlatform;
  final onPlatformSelect;
  const NFTInputForm(
      {required this.chainIDController,
      required this.contractAddressController,
      required this.tokenIDController,
      required this.apiKeyController,
      this.intiSelectedPlatform = APIOption.airStack,
      this.onPlatformSelect,
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
  late TextEditingController _apiKeyController;

  late APIOption intiSelectedPlatform;

  @override
  void initState() {
    super.initState();
    _chainIDController = widget.chainIDController;
    _contractAddressController = widget.contractAddressController;
    _tokenIDController = widget.tokenIDController;
    _apiKeyController = widget.apiKeyController;
    intiSelectedPlatform = widget.intiSelectedPlatform;
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
    contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
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
          Row(
            children: [
              DropdownButton<APIOption>(
                value: intiSelectedPlatform,
                onChanged: (APIOption? newValue) {
                  widget.onPlatformSelect(newValue);
                  setState(() {
                    intiSelectedPlatform = newValue!;
                  });
                },
                underline: Container(), // Removes the bottom underline
                iconSize: 20, // Decrease the size of the dropdown icon
                icon: const Icon(Icons.arrow_drop_down),
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground), // Decrease the text size
                items: const <DropdownMenuItem<APIOption>>[
                  DropdownMenuItem(
                    value: APIOption.airStack,
                    child: Text('AirStack'),
                  ),
                  DropdownMenuItem(
                    value: APIOption.openSea,
                    child: Text('OpenSea'),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: SizedBox(
                  // width: 122,
                  // height: 36,
                  child: TextFormField(
                    controller: _apiKeyController,
                    obscureText: true,
                    decoration: inputDecoration.copyWith(labelText: "API Key"),
                    style: style,
                  ),
                ),
              ),
            ],
          ),
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
