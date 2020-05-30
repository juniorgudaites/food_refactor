import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'file:///D:/Google%20Drive/Anhembi%20Morumbi/TCC/food_refactor/lib/database/dao/insert/recipes_insert.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/dashboard(deletar).dart';
import 'package:food_refactor/views/menu_dashboard.dart';

void main() {
  runApp(FoodRefactor());
}

class FoodRefactor extends StatelessWidget {
  RecipesDao recipesDao = RecipesDao();

  @override
  Widget build(BuildContext context) {

//    recipesDao.insert();

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
