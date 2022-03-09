import 'package:flutter/material.dart';
import 'package:loka_app/constants.dart';
import 'package:loka_app/services/ingredients.dart';
import 'package:loka_app/ui_components/ingredient_widget.dart';
import 'package:loka_app/ui_components/instruction_widget.dart';

class ResultWindow extends StatelessWidget {
  final String name;
  final String glass;
  final String category;
  final String preparation;
  final List<Ingredient> ingredient;

  ResultWindow({
    @required this.name,
    @required this.category,
    @required this.glass,
    @required this.preparation,
    @required this.ingredient,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                name,
                style: kHeaderTextStyle,
              ),
            ),
            Center(
              child: Text(
                category,
                style: kHeaderTextStyle,
              ),
            ),
            Center(
              child: Text(
                glass,
                style: kHeaderTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: kBoxDecorationStyle,
              child: InstructionWidget(
                instructions: preparation,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 200,
              decoration: kBoxDecorationStyle,
              child: IngredientWidget(
                ingredientList: ingredient,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Return"),
                style: ElevatedButton.styleFrom(
                    primary: kComponentsColor,
                    minimumSize: kButtonMinSize,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
