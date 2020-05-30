import 'package:food_refactor/database/dao/insert/categories_insert.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:food_refactor/models/recipe.dart';


class RecipesInsert{

  static final Recipe boloChocolate = Recipe(
      name: 'Bolo de Chocolate',
      description: 'Bolo de Chocolate com cobertura de chocolate',
      listIngredients:
      Ingredient(name: 'Farinha', quantity: '3 xicaras').toString() +
          Ingredient(name: 'Chocolate', quantity: '3 Colheres de sopa')
              .toString(),
      preparationMode: 'Asse a 180c',
      category: CategoriesInsert.bolos.name,
      id: 1,
      pathImage: 'assets/receitas/bolos/bolo_de_chocolate.jpg');
  static final Recipe boloCenoura = Recipe(
      name: 'Bolo de Cenoura',
      description: 'Bolo de Cenoura com cobertura de chocolate',
      listIngredients: Ingredient(name: 'cenoura', quantity: '1').toString(),
      preparationMode: 'Asse a 180c',
      category: CategoriesInsert.bolos.name,
      id: 2,
      pathImage: 'assets/receitas/bolos/bolo_de_cenoura.jpg');
  static final Recipe brigadeiro = Recipe(
      name: 'Brigadeiro',
      description: 'Doce de Brigadeiro na panela',
      listIngredients: Ingredient(
          name: 'chocolate', quantity: '3 colheres de sopa')
          .toString() +
          Ingredient(name: 'leite condesado', quantity: '1 caixa').toString(),
      preparationMode:
      'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela',
      category: CategoriesInsert.doces.name,
      id: 3,
      pathImage: 'assets/receitas/doces/brigadeiro.jpg');

}