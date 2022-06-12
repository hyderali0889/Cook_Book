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
import '../components/AppBar.dart';
import '../components/ComponentCard.dart';
import '../components/IngredientsCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var AllCategories;
  var AllAreas;
  var AllIngredients;
  var ARandomRecipe;
  @override
  void initState() {
    super.initState();

    getListOfAllCategories();
    getListOfAllAreas();
    getListOfAllIngredients();
    getARandomRecipe();
  }

  getListOfAllCategories() async {
    try {
      var dat = await FetchApi().fetchListOfAllCategory();
      if (dat != null) {
        setState(() {
          AllCategories = dat["meals"];
        });
        print(dat["meals"].length);
      }
    } catch (e) {
      print(e);
    }
  }

  getListOfAllAreas() async {
    try {
      var dat = await FetchApi().fetchListOfAllAreas();
      if (dat != null) {
        setState(() {
          AllAreas = dat["meals"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getListOfAllIngredients() async {
    try {
      var dat = await FetchApi().fetchListOfAllIngredients();
      if (dat != null) {
        setState(() {
          AllIngredients = dat["meals"];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getARandomRecipe() async {
    try {
      var dat = await FetchApi().fetchARandomRecipe();
      if (dat != null) {
        setState(() {
          ARandomRecipe = dat["meals"];
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Platform.isAndroid || Platform.isIOS
              ? Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top))
              : TitleBar().mainAppBar(),
          Expanded(
            child: ListView(shrinkWrap: true, children: [mobileView()]),
          ),
        ],
      ),
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
          AllCategories == null
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
                      itemCount: AllCategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllCategories[index]["strCategory"] == "Pork" ? const Center(child: Text(" "),) : ComponentCard(
                            text: AllCategories[index]["strCategory"],
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
          AllAreas == null
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
                      itemCount: AllAreas.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllAreas[index]["strArea"] == "Unknown" ? const Center(child: Text(" "),) : ComponentCard(
                            text: AllAreas[index]["strArea"],
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
          AllIngredients == null
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
                      itemCount: AllIngredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AllIngredients[index]["strIngredient"] == "Pork" ? const Center(child: Text(" "),) : IngredientsCard(
                            headingText: AllIngredients[index]["strIngredient"],
                            text: AllIngredients[index]["strDescription"],
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
              ? ARandomRecipe == null
                  ? Center(
                      child: Image.asset("assets/gifs/loader.gif"),
                    )
                  : Padding(
                    padding: const EdgeInsets.only(right:15.0 , bottom: 15.0),
                    child: MobileCard(
                        data: Column(
                          children: [
                            Text(ARandomRecipe[0]["strMeal"],
                                style: TextStyle(
                                    fontSize: Sizes.lg,
                                    fontFamily: 'QuickSand',
                                    color: Color.headingColor)),
                          ],
                        ),
                        fun: MobileRandomRecipe,
                        img: ClipRRect(
                            borderRadius: BorderRadius.circular(14.0),
                            child: FadeInImage.assetNetwork(
                              image: ARandomRecipe[0]["strMealThumb"],
                              placeholder: 'assets/gifs/loader.gif',
                            )),
                      ),
                  )

              //
              // ──────────────────────────────────────────────────────────────────── V ──────────
              //   :::::: D E S K T O P   W I D G E T : :  :   :    :     :        :          :
              // ──────────────────────────────────────────────────────────────────────────────
              //

              : ARandomRecipe == null
                  ? Center(
                      child: Image.asset("assets/gifs/loader.gif"),
                    )
                  : ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse
                          }),
                      child: 
                         SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                          child: MainCard(
                            img: ClipRRect(
                                borderRadius: BorderRadius.circular(14.0),
                                child: FadeInImage.assetNetwork(
                                  image: ARandomRecipe[0]["strMealThumb"],
                                  placeholder: 'assets/gifs/loader.gif',
                                )),
                            data: Column(children: [
                              Text(ARandomRecipe[0]["strMeal"],
                                  style: TextStyle(
                                      fontSize: Sizes.lg,
                                      fontFamily: 'QuickSand',
                                      color: Color.headingColor)),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Flexible(
                                    child: Text(
                                        ARandomRecipe[0]["strInstructions"],
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontSize: Sizes.sm,
                                            fontFamily: 'QuickSand',
                                            color: Color.simpleColor)),
                                  ),
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

MobileRandomRecipe() {
  print("Mobile");
}
