import 'package:flutter/material.dart';

class Category{
  final int id;
  final String name;
  final int idRecipe;
  final String pathImage;


  Category({this.id, @required this.name,  this.idRecipe, this.pathImage});

  @override
  String toString() {
    return 'Category{id: $id, name: $name, idRecipe: $idRecipe}';
  }
}