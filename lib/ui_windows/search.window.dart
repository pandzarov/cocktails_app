import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loka_app/constants.dart';
import 'package:loka_app/services/cocktail_menager.dart';
import 'package:http/http.dart';
import 'package:loka_app/services/ingredients.dart';
import 'package:loka_app/ui_windows/result_window.dart';

class SearchWindow extends StatefulWidget {
  @override
  _SearchWindow createState() => _SearchWindow();
}

class _SearchWindow extends State<SearchWindow> {
  String cocktailName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),

              // Logo Text
              Center(
                child: Text(
                  "Cocktails",
                  style: TextStyle(fontSize: 30),
                ),
              ),

              //Text Input
              SizedBox(height: 25),

              TextField(
                onChanged: (value) {
                  cocktailName = value;
                },
                decoration: InputDecoration(
                  hintText: "Name a Cocktail?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: kComponentsColor,
                      width: 3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: kComponentsColor,
                      width: 3,
                    ),
                  ),
                ),
              ),

              //Search Button
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  if (cocktailName == null) return;

                  cocktailName.toLowerCase().replaceAll(' ', '_');

                  CocktailManager cm = CocktailManager();

                  var network = await get(Uri.parse(kMainUrl + cocktailName));

                  var json = jsonDecode(network.body);

                  cm.name = json['drinks'][0]['strDrink'];
                  cm.glass = json['drinks'][0]['strGlass'];
                  cm.category = json['drinks'][0]['strCategory'];
                  cm.preparation = json['drinks'][0]['strInstructions'];

                  String strIngredientName, strIngredientMeasure;
                  List<Ingredient> ingredientList = [];

                  for (int i = 0; i < 16; i++) {
                    strIngredientName = 'strIngredient' + i.toString();
                    strIngredientMeasure = 'strMeasure' + i.toString();

                    ingredientList.add(
                      Ingredient(
                        name: json['drinks'][0][strIngredientName],
                        mesure: json['drinks'][0][strIngredientMeasure],
                      ),
                    );
                  }

                  ingredientList.retainWhere((element) =>
                      element.name == null && element.mesure == null);

                  ingredientList.forEach((element) {
                    if (element.mesure == null) {
                      element.mesure = ' ';
                    }
                  });

                  cm.ingredient = ingredientList;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultWindow(
                        name: cm.name,
                        category: cm.category,
                        glass: cm.glass,
                        preparation: cm.preparation,
                        ingredient: cm.ingredient,
                      );
                    }),
                  );
                },
                child: Text("Search"),
                style: ElevatedButton.styleFrom(
                  primary: kComponentsColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: kButtonMinSize,
                ),
              ),
              SizedBox(height: 15),

              Center(
                child: Text(
                  "List of Cocktails",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
