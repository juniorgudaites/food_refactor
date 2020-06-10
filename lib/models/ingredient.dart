import 'package:flutter/material.dart';

class Ingredient {
  final int id;
  final String name;
  final String quantity;
  final List<Ingredient> listRecipes;
  bool have = false;

  Ingredient({this.id, @required this.name, this.quantity, this.listRecipes});

  @override
  String toString() {
    return '$name: $quantity';
  }
}
