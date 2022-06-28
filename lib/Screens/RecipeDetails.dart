// ignore_for_file: file_names

import 'dart:io';

import 'package:advance_notification/advance_notification.dart';
import 'package:cook_book/Utils/ApiCall.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import "../Theme/Colors.dart";
import '../Theme/Sizes.dart';
import '../Theme/Spacing.dart';
import '../components/AppBarWithBackButton.dart';

class RecipeDetails extends StatefulWidget {
  final String recipeName;
  const RecipeDetails({Key? key, required this.recipeName}) : super(key: key);

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  dynamic recipeDetails;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    getRecipeDettails();
  }

  getRecipeDettails() async {
    try {
      dynamic data = await FetchApi().fetchDataByName(widget.recipeName);
      Future.delayed(Duration(seconds: 10), () {
        setState(() {
        isError = true;
      });
       });
      setState(() {
        recipeDetails = data["meals"];
      });
    } catch (e) {
      setState(() {
        isError = true;
      });
      const AdvanceSnackBar(
              message: "Nothing Found", type: sType.ERROR, mode: Mode.MODERN)
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.backgroundColor,
      body: Platform.isAndroid || Platform.isIOS
          ? Column(
              children: [mobileView()],
            )
          : Column(children: [
              TitleBarNew().mainAppBar(context),
              Expanded(
                child: mobileView(),
              )
            ]),
    );
  }

  mobileView() {
    return recipeDetails == null
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: isError
                    ? Column(
                        children: [
                          Image.asset("assets/images/NotConnected.png"),
                        ],
                      )
                    : Image.asset("assets/gifs/loader.gif")),
          )
        : Center(
            child: Text(
              recipeDetails[0]["strMeal"],
              style: TextStyle(color: Colors.white),
            ),
          );
  }
}
