// ignore_for_file: file_names
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:cook_book/Theme/Sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import '../Theme/Colors.dart';

class TitleBar {
  mainAppBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.transparent],
                  stops: [0.0, 1.0]),
            ),
            child: Column(children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(children: [
                      Center(
                          child: Text(
                        'CookBook',
                        style: TextStyle(
                            fontFamily: 'QuickSand',
                            fontSize: Sizes.xl,
                            color: Color.textColor.withGreen(150)),
                      )),
                      MoveWindow()
                    ])),
                    const WindowButtons()
                  ],
                ),
              )
            ]),
          ),
        )
      ],
    );
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: HexColor('ffffff'),
    mouseOver: HexColor('FFF6A0'),
    mouseDown: HexColor('FF8053'),
    iconMouseOver: HexColor('FF8053'),
    iconMouseDown: HexColor('FFFFD5'));

final closeButtonColors = WindowButtonColors(
    mouseOver: HexColor('FFD32F'),
    mouseDown: HexColor('FFB71C'),
    iconNormal: Colors.red,
    iconMouseOver: HexColor('ffffff'));
