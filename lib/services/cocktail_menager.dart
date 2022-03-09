import 'package:loka_app/services/ingredients.dart';

class CocktailManager {
  String name;
  String glass;
  String category;
  String preparation;
  List<Ingredient> ingredient;

  CocktailManager({
    this.name = " ",
    this.category = " ",
    this.glass = " ",
    this.preparation = " ",
    this.ingredient,
  });
}
