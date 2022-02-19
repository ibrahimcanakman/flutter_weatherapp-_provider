import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({Key? key}) : super(key: key);

  @override
  State<SehirSecWidget> createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şehir Seç'),
      ),
      body: Form(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context, _textController.text);
                      },
                      icon: const Icon(
                        Icons.search,
                      )),
                  label: const Text('Şehir'),
                  hintText: 'Şehir Seçin',
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
