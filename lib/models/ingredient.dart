import 'package:flutter/material.dart';
import 'package:food_refactor/models/recipe.dart';

class Ingredient {
  final int id;
  final String name;
  final String quantity;
  final List<Recipe> listRecipes;

  Ingredient({this.id, @required this.name, this.quantity, this.listRecipes});

  @override
  String toString() {
    return 'Ingredient{id: $id, name: $name, quantity: $quantity, listRecipes: $listRecipes}';
  }
}
