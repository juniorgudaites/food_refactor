import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/ingredients_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/views/list_categories.dart';
import 'package:food_refactor/views/list_ingredients.dart';
import 'package:food_refactor/views/list_recipes.dart';

Widget menu(context, _slideAnimation, _menuScaleAnimation) {
  RecipesDao _recipesDao = RecipesDao();
  CategoriesDao _categoriesDao = CategoriesDao();
  IngredientsDao _ingredientsDao = IngredientsDao();

  return SlideTransition(
    position: _slideAnimation,
    child: ScaleTransition(
      scale: _menuScaleAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              menuItem(
                text: 'Receitas',
                icon: Icons.book,
                onClick: () => _showList(context,
                    title: 'Receitas', list: _recipesDao.findAll()),
              ),
              SizedBox(height: 10),
              menuItem(
                text: 'Categorias',
                icon: Icons.view_list,
                onClick: () => _showCategoriesList(context,title: 'Categorias', list: _categoriesDao.findAll()),
              ),
              SizedBox(height: 10),
              menuItem(
                text: 'Ingredients',
                icon: Icons.filter_list,
                onClick: () => _showIngredientsList(context,title:'Ingredientes', list: _ingredientsDao.findAll()),
              ),
              SizedBox(height: 10),
              menuItem(
                text: 'Favoritos',
                icon: Icons.favorite,
                onClick: () => _showList(context,
                    title: 'Favoritos', list: _recipesDao.searchFavorite()),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _showList(BuildContext context, {Future<List> list, String title}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ListRecipes(
        title: title,
        list: list,
      ),
    ),
  );
}

void _showCategoriesList(BuildContext context,{Future<List> list,String title}){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ListCategories(title: title, list: list,),
    ),
  );
}

void _showIngredientsList(BuildContext context,{Future<List> list,String title}){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ListIngredients(title: title, list: list,),
    ),
  );
}

Widget menuItem({String text, IconData icon, Function onClick}) {
  return InkWell(
    onTap: () => onClick(),
    child: Container(
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: secondColor(),
            size: 30,
          ),
          SizedBox(width: 12),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 28)),
        ],
      ),
    ),
  );
}
