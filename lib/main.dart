import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:food_refactor/views/dashboard.dart';


void main() {
  runApp(FoodRefactor());
}

class FoodRefactor extends StatelessWidget {

  static final Category bolo = Category(name: 'Bolos', id: 1, idRecipe: 0);
  static final Category doce = Category(name: 'Doces', id: 2, idRecipe: 0);
  final RecipesDao _daoRecipies = RecipesDao();
  final CategoriesDao _daoCategories = CategoriesDao();
  final Recipe boloChocolate = Recipe(
      name: 'Bolo de Chocolate',
      description: 'Bolo de Chocolate com cobertura de chocolate',
      listIngredients:
        Ingredient(name: 'Farinha', quantity: '3 xicaras').toString()+
        Ingredient(name: 'Chocolate', quantity: '3 Colheres de sopa').toString(),
      preparationMode: 'Asse a 180c',
      category: bolo.name,
      id: 1,
      pathImage: 'assets/receitas/bolos/bolo_de_chocolate.jpg');
  final Recipe boloCenoura = Recipe(
      name: 'Bolo de Cenoura',
      description: 'Bolo de Cenoura com cobertura de chocolate',
      listIngredients:
        Ingredient(name: 'cenoura', quantity: '1').toString(),
      category: bolo.name,
      id: 2,
      pathImage: 'assets/receitas/bolos/bolo_de_cenoura.jpg');
  final Recipe brigadeiro = Recipe(
      name: 'Brigadeiro',
      description: 'Doce de Brigadeiro na panela',
      listIngredients:
        Ingredient(name: 'chocolate', quantity: '3 colheres de sopa').toString()+
        Ingredient(name: 'leite condesado', quantity: '1 caixa').toString(),
      preparationMode: 'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela',
      category: doce.name,
      id: 3,
      pathImage: 'assets/receitas/doces/brigadeiro.jpg');


  @override
  Widget build(BuildContext context) {

    // Limpar Tabelas
    _daoRecipies.deleteTable();
    _daoCategories.deleteTable();
    // Salvar Receitas e Categorias
    _daoCategories.save(bolo);
    _daoCategories.save(doce);
    _daoRecipies.save(boloChocolate);
    _daoRecipies.save(boloCenoura);
    _daoRecipies.save(brigadeiro);

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
      home: Dashboard(),
    );
  }
}
