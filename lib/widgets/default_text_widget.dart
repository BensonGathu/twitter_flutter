import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultTextInput extends StatelessWidget {
  final String dataValue;
  final String hintText;
  const DefaultTextInput({super.key, required this.dataValue, required this.hintText});

  @override
  Widget build(BuildContext context) {
     final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: TextEditingController(
          text: dataValue), // <-- SEE HERE
      decoration: InputDecoration(labelText: hintText,enabled: false,),
    );
  }
}
