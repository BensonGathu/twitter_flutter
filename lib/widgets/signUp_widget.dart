import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextInputField(
      {super.key,
      required this.textEditingController,
      required this.textInputType,
      required this.hintText,
      required this.isPass});

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return  TextField(
                  controller:
                      TextEditingController(text: textEditingController.text),
                  decoration: InputDecoration(

                      // hintText: hintText,
                      border: InputBorder,
                      focusedBorder: InputBorder,
                      enabledBorder: InputBorder,
                      filled: false,
                      labelText: hintText,
                      contentPadding: const EdgeInsets.all(8),),
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enabled: false,
                  
                );
  }
}
