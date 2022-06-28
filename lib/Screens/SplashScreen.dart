// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';
import 'package:advance_notification/advance_notification.dart';
import 'package:cook_book/Screens/NoConnection.dart';
import 'package:cook_book/Theme/Sizes.dart';
import 'package:cook_book/Utils/GradientText.dart';
import 'package:flutter/material.dart';
import '../Theme/Colors.dart';
import '../components/AppBar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../components/Navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Connectivity _connectivity = Connectivity();
  @override
  void initState() {
    super.initState();
    initConnectivity();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const Navigation())));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const NotConnected())));
      }
    } catch (e) {
      const AdvanceSnackBar(
        message: "An Error Occured , Please Check Your Internet Connection",
        mode: Mode.ADVANCE,
        type: sType.DARK,
        duration: Duration(seconds: 5),
      ).show(context);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.backgroundColor,
      body: Column(
        children: [
          Platform.isAndroid || Platform.isIOS
              ? Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top))
              : TitleBar().mainAppBar(),
          Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: Center(
                child: GradientText(
              "CookBook",
              style: TextStyle(
                fontSize: Sizes.mainHeadings,
              ),
              gradient: LinearGradient(colors: [
                Color.textColor,
                Color.foregroundColor,
              ]),
            )),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Image.asset("assets/gifs/loader.gif"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
