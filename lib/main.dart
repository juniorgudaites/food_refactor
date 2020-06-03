import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/views/menu_dashboard.dart';

void main() {
  runApp(FoodRefactor());
}

class FoodRefactor extends StatelessWidget {
  RecipesDao recipesDao = RecipesDao();
  CategoriesDao categoriesDao = CategoriesDao();

  @override
  Widget build(BuildContext context) {

    recipesDao.insert();
    categoriesDao.insert();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor(),
        accentColor: secondColor(),
        buttonTheme: ButtonThemeData(
          buttonColor: secondColor(),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: MenuDashboard(),
//      home: Dashboard(),
    );
  }
}
