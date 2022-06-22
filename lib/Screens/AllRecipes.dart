// ignore_for_file: file_names

import 'dart:io';

import 'package:cook_book/Utils/ApiCall.dart';
import 'package:cook_book/components/AppBarWithBackButton.dart';
import 'package:cook_book/components/ComponentCard.dart';
import 'package:cook_book/components/MobileIngredientCard.dart';
import 'package:flutter/material.dart';
import '../Theme/Colors.dart';

class AllRecipes extends StatefulWidget {
  final String data;
  const AllRecipes({Key? key, required this.data}) : super(key: key);

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  @override
  void initState() {
    super.initState();
    getAllRecipes();
  }

  var allRecipes;

  getAllRecipes() async {
    if (widget.data.isNotEmpty) {
      var data = await FetchApi().fetchDataByCategory(widget.data);
      setState(() {
        allRecipes = data['meals'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.backgroundColor,
      body: Platform.isAndroid || Platform.isIOS
            ?
            //
            // ────────────────────────────────────────────────────────────────── I ──────────
            //   :::::: M O B I L E V E R S I O N : :  :   :    :     :        :          :
            // ────────────────────────────────────────────────────────────────────────────
            //

            Column()
            :
            //
            // ────────────────────────────────────────────────────────────────────── I ──────────
            //   :::::: D E S K T O P   V E R S I O N : :  :   :    :     :        :          :
            // ────────────────────────────────────────────────────────────────────────────────
            //

             Column(
                  children: [
                    TitleBarNew().mainAppBar(context),
                    Expanded(
                      child: allRecipes != null
                      ? SizedBox(
                           height: 150,
   width: 150,
                        child: Container(
   height: 150,
   width: 150,
   color: Colors.red,
                        ),
                      )
                          // ? ListView.builder(
                          //     itemCount: allRecipes.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return SizedBox(
                          //         width: 150,
                          //         child: MobileCard(
                          //             data: Text(allRecipes[index]["strMeal"]),
                          //             fun: () {},
                          //             img: SizedBox(
                          //                 width: 50,
                          //                 height: 50,
                          //                 child: Image.network(
                          //                     allRecipes[index]['strMealThumb']))),
                          //       );
                          //     },
                          //   )
                          : const Text("Loading ..."),
                    )
                  ],
                ),
            );

  }
}
