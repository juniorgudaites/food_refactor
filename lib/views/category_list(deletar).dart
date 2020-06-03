import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/components/centered_message.dart';
import 'package:food_refactor/components/progress.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/recipe_item(deletar).dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final CategoriesDao _dao = new CategoriesDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Categorias'),
      body: FutureBuilder<List<Category>>(
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
              final List<Category> categories = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Category category = categories[index];
                  return CategoryItem(category);
                },
                itemCount: categories.length,
              );
              break;
          }
          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoryDetails(category),
            ),
          );
          debugPrint(category.toString());
        },
        child: Card(
          child: ListTile(
            title: Text(
              category.name,
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryDetails extends StatelessWidget {
  final Category category;

  CategoryDetails(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas de ${category.name}'),
      ),
      body: FutureBuilder<List<Recipe>>(
        initialData: List(),
//        future: _dao.searchCategoryById(category.id),
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
