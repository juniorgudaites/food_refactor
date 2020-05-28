import 'package:flutter/material.dart';
import 'package:food_refactor/components/centered_message.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/components/progress.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/recipe_item.dart';

class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {

  final RecipesDao _dao = new RecipesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Receitas Favoritas'),
      body: FutureBuilder<List<Recipe>>(
        initialData: List(),
        future: _dao.searchFavorite(),
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
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Recipe recipe = recipes[index];
                  return RecipeItem(recipe);
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
