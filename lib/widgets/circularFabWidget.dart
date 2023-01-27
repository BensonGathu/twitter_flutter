import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CircularFabWidget extends StatefulWidget {
  const CircularFabWidget({super.key});

  @override
  State<CircularFabWidget> createState() => _CircularFabWidgetState();
}

class _CircularFabWidgetState extends State<CircularFabWidget> {
  @override
  Widget build(BuildContext context) => Flow(
        delegate: FlowMenuDelegate(),
        children: <IconData>[
          Icons.brush,
          Icons.gif_outlined,
          Icons.photo_outlined,
          Icons.space_bar,
        ].map<Widget>(buildFAB).toList(),
      );

  Widget buildFAB(IconData icon) => FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        splashColor: Colors.black,
        child: Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
      );
}

class FlowMenuDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    
    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (value) => isLastItem ? 0.0 : value;

      final radius = 45;
      final theta = i * pi * 0.5 / (n - 2);
      final x = setValue(radius * cos(theta));
      final y = setValue(radius * sin(theta));

      context.paintChild(
        i,
        transform: Matrix4.identity()..translate(x, y, 0),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}
