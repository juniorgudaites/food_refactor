import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/centered_message.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/components/progress.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/recipe_item.dart';

class RecipesList extends StatefulWidget {
  @override
  _RecipesListState createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  final RecipesDao _dao = new RecipesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Receitas'),
      body: FutureBuilder<List<Recipe>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Recipe> recipes = snapshot.data;
              return ListView.separated(
                itemBuilder: (context, index) {
                  final Recipe recipe = recipes[index];
                  return RecipeItem(recipe);
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 16);
                },
                itemCount: recipes.length,
              );
              break;
          }
          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}




