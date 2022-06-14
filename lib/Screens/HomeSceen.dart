// ignore_for_file: file_names
import 'dart:io';
import 'dart:ui';
import 'package:cook_book/Theme/Sizes.dart';
import 'package:cook_book/Theme/Spacing.dart';
import 'package:cook_book/components/Card.dart';
import 'package:cook_book/components/MobileIngredientCard.dart';
import 'package:flutter/material.dart';
import '../Theme/Colors.dart';
import '../Utils/ApiCall.dart';
import '../components/ComponentCard.dart';
import '../components/IngredientsCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic allCategories;
  dynamic allAreas;
  dynamic allIngredients;
  dynamic aRandomRecipe;
  @override
  void initState() {
    super.initState();

    getListOfallCategories();
    getListOfallAreas();
    getListOfallIngredients();
    getaRandomRecipe();
  }

  getListOfallCategories() async {
    try {
      var dat = await FetchApi().fetchListOfAllCategory();
      if (dat != null) {
        setState(() {
          allCategories = dat["meals"];
        });
        print(dat["meals"].length);
      }
    } catch (e) {
      print(e);
    }
  }

  getListOfallAreas() async {
    try {
      var dat = await FetchApi().fetchListOfAllAreas();
      if (dat != null) {
        setState(() {
          allAreas = dat["meals"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getListOfallIngredients() async {
    try {
      var dat = await FetchApi().fetchListOfAllIngredients();
      if (dat != null) {
        setState(() {
          allIngredients = dat["meals"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getaRandomRecipe() async {
    try {
      var dat = await FetchApi().fetchARandomRecipe();
      if (dat != null) {
        setState(() {
          aRandomRecipe = dat["meals"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.backgroundColor,
      body: ListView(shrinkWrap: true, children: [mobileView()]),
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(left: Spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.md),
            child: Center(
              child: Text(
                "Welcome To Cookbook",
                style: TextStyle(
                    fontSize: Sizes.mainHeadings,
                    fontFamily: 'QuickSand',
                    color: Color.headingColor),
              ),
            ),
          ),
//
// ──────────────────────────────────────────────────────── I ──────────
//   :::::: P A R T   O N E : :  :   :    :     :        :          :
// ──────────────────────────────────────────────────────────────────
//

          Padding(
            padding: EdgeInsets.only(bottom: Spacing.md),
            child: Text("Explore All Categories",
                style: TextStyle(
                    fontSize: Sizes.headings,
                    fontFamily: 'QuickSand',
                    color: Color.textColor)),
          ),
          allCategories == null
              ? Center(
                  child: Image.asset("assets/gifs/loader.gif"),
                )
              : ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse
                      }),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: allCategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return allCategories[index]["strCategory"] == "Pork"
                            ? const Center(
                                child: Text(" "),
                              )
                            : ComponentCard(
                                text: allCategories[index]["strCategory"],
                                func: () {
                                  print('$index');
                                });
                      },
                    ),
                  ),
                ),

//
// ──────────────────────────────────────────────────────── II ──────────
//   :::::: P A R T   T W O : :  :   :    :     :        :          :
// ──────────────────────────────────────────────────────────────────
//

          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.md),
            child: Text("Explore All Areas",
                style: TextStyle(
                    fontSize: Sizes.headings,
                    fontFamily: 'QuickSand',
                    color: Color.textColor)),
          ),
          allAreas == null
              ? Center(
                  child: Image.asset("assets/gifs/loader.gif"),
                )
              : ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse
                      }),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: allAreas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return allAreas[index]["strArea"] == "Unknown"
                            ? const Center(
                                child: Text(" "),
                              )
                            : ComponentCard(
                                text: allAreas[index]["strArea"],
                                func: () {
                                  print('$index');
                                });
                      },
                    ),
                  ),
                ),

//
// ──────────────────────────────────────────────────────────── III ──────────
//   :::::: P A R T   T H R E E : :  :   :    :     :        :          :
// ──────────────────────────────────────────────────────────────────────
//

          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.md),
            child: Text("Explore All Ingredients",
                style: TextStyle(
                    fontSize: Sizes.headings,
                    fontFamily: 'QuickSand',
                    color: Color.textColor)),
          ),
          allIngredients == null
              ? Center(
                  child: Image.asset("assets/gifs/loader.gif"),
                )
              : ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse
                      }),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: allIngredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return allIngredients[index]["strIngredient"] == "Pork"
                            ? const Center(
                                child: Text(" "),
                              )
                            : IngredientsCard(
                                headingText: allIngredients[index]
                                    ["strIngredient"],
                                text: allIngredients[index]["strDescription"],
                                func: () {
                                  print('$index');
                                });
                      },
                    ),
                  ),
                ),
//
// ────────────────────────────────────────────────────────── IV ──────────
//   :::::: P A R T   F O U R : :  :   :    :     :        :          :
// ────────────────────────────────────────────────────────────────────
//
//
// ────────────────────────────────────────────────────────────────── VI ──────────
//   :::::: M O B I L E   W I D G E T : :  :   :    :     :        :          :
// ────────────────────────────────────────────────────────────────────────────
//

          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.md),
            child: Text("Our Recomendation for today",
                style: TextStyle(
                    fontSize: Sizes.headings,
                    fontFamily: 'QuickSand',
                    color: Color.textColor)),
          ),
          Platform.isAndroid || Platform.isIOS
              ? aRandomRecipe == null
                  ? Center(
                      child: Image.asset("assets/gifs/loader.gif"),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                      child: MobileCard(
                        data: Column(
                          children: [
                            Text(aRandomRecipe[0]["strMeal"],
                                style: TextStyle(
                                    fontSize: Sizes.lg,
                                    fontFamily: 'QuickSand',
                                    color: Color.headingColor)),
                          ],
                        ),
                        fun: mobileRandomRecipe,
                        img: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: FadeInImage.assetNetwork(
                              image: aRandomRecipe[0]["strMealThumb"],
                              placeholder: 'assets/gifs/loader.gif',
                            )),
                      ),
                    )

//
// ──────────────────────────────────────────────────────────────────── V ──────────
//   :::::: D E S K T O P   W I D G E T : :  :   :    :     :        :          :
// ──────────────────────────────────────────────────────────────────────────────
//

              : aRandomRecipe == null
                  ? Center(
                      child: Image.asset("assets/gifs/loader.gif"),
                    )
                  : ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse
                          }),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 550,
                        child: MainCard(
                          img: ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: FadeInImage.assetNetwork(
                                image: aRandomRecipe[0]["strMealThumb"],
                                placeholder: 'assets/gifs/loader.gif',
                              )),
                          data: Column(children: [
                            Text(aRandomRecipe[0]["strMeal"],
                                style: TextStyle(
                                    fontSize: Sizes.lg,
                                    fontFamily: 'QuickSand',
                                    color: Color.headingColor)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, right: 15.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(aRandomRecipe[0]["strInstructions"],
                                    maxLines: 25,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: Sizes.sm,
                                        fontFamily: 'QuickSand',
                                        color: Color.simpleColor)),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}

mobileRandomRecipe() {
  print("Mobile");
}
