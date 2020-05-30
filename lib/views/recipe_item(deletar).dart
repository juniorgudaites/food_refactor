import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/recipe_details.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              //builder: (context) => Text(recipe.toString()),
              builder: (context) => RecipeDetails(recipe),
            ),
          );
          debugPrint("Objeto: ${recipe.hashCode}");
          debugPrint(recipe.toString());
        },
        child: Card(
          color: listTileColor(),
          child: ListTile(
            title: Text(
              recipe.name,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            subtitle: Text(
              recipe.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            trailing: Image.asset(recipe.pathImage),
          ),
        ),
      ),
    );
  }
}
