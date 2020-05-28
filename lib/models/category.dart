import 'package:flutter/material.dart';

class Category{
  final int id;
  final String name;
  final int idRecipe;


  Category({this.id, @required this.name,  this.idRecipe});

  @override
  String toString() {
    return 'Category{id: $id, name: $name, idRecipe: $idRecipe}';
  }
}