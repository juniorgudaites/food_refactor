import 'package:flutter/material.dart';


class Recipe{
  final int id;
  final String name;
  final String description;
//  final List<Ingredient> listIngredients;
  final String listIngredients;
  final String preparationMode;
  final String category;
  final String pathImage;
  int favorite=0;

  Recipe({this.id, @required this.name, this.description, this.listIngredients, this.preparationMode, this.category,  this.favorite,this.pathImage});

  @override
  String toString() {
    return 'Recipe{id: $id, name: $name, description: $description, listIngredients: $listIngredients, preparationMode: $preparationMode, category: $category, pathImage: $pathImage, favorite: $favorite}';
  }
}

