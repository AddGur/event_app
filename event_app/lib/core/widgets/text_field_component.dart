import 'package:flutter/material.dart';

class TextFieldComponent extends StatefulWidget {
  final String? text;
  final String label;
  final TextEditingController? controller;

  const TextFieldComponent(
      {super.key, this.text, this.controller, required this.label});

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  late TextEditingController controller;

  @override
  void initState() {
    if (widget.controller != null) {
      controller = widget.controller!;
    } else {
      controller = TextEditingController();
    }
    if (widget.text != null) {
      controller.text = widget.text!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: widget.label),
      ),
    );
  }
}
