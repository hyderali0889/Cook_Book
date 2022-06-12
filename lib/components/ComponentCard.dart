// ignore_for_file: file_names
import 'dart:io';

import 'package:cook_book/Theme/Spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hovering/hovering.dart';
import '../Theme/Colors.dart';
import '../Theme/Sizes.dart';

class ComponentCard extends StatelessWidget {
  const ComponentCard({Key? key, required this.text, required this.func})
      : super(key: key);
  final String text;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: Spacing.md),
        child: HoverButton(
          color: Color.iconColor,
          hoverColor: Color.foregroundColor,
          minWidth: Platform.isAndroid || Platform.isIOS ? 100 : 125,
          height: Platform.isAndroid || Platform.isIOS ? 40 : 75,
          onpressed: func,
          child: SizedBox(
            child: Center(
                child: Text(text,
                    style: TextStyle(
                        fontSize: Sizes.lg,
                        fontFamily: 'QuickSand',
                        color: Color.textColor))),
          ),
        ));
  }
}
