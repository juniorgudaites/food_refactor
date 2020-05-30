import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/centered_message.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/recipe_item(deletar).dart';

class RecipesListSearch extends StatefulWidget {
  final Future<List<Recipe>> searchRecipe;
  RecipesListSearch(this.searchRecipe);
  @override
  _RecipesListSearchState createState() => _RecipesListSearchState(this.searchRecipe);
}

class _RecipesListSearchState extends State<RecipesListSearch> {

  final Future<List<Recipe>> searchRecipe;
  _RecipesListSearchState(this.searchRecipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Receitas Encontradas'),
      body: FutureBuilder<List<Recipe>>(
        initialData: List(),
        future: searchRecipe,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
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
