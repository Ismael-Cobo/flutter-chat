import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onChange;

  const MessageFieldBox({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final inputDecoration = InputDecoration(
      hintText: 'Acaba tu mensaje con un "?"',
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isEmpty) return;
          onChange(textValue);
          textController.clear();
        },
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        if (value.isEmpty) return;
        onChange(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
