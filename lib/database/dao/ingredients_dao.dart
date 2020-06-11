import 'package:food_refactor/database/dao/insert/ingredients_insert.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_refactor/database/app_database.dart';


class IngredientsDao {

  // Table Category
  static const String tableIngredientSql = 'CREATE TABLE $_tableIngredient('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_idRecipe INTEGER)';
//      '$_have TEXT)';

  static const String _tableIngredient = 'ingredients';
  static const String _id = 'idIngredient';
  static const String _name = 'nameIngredient';
  static const String _idRecipe = 'idRecipe';
  static const String _have = 'have';


  String getNameTableCategory() => _tableIngredient;

  insert(){
    save(IngredientsInsert.acucar);
    save(IngredientsInsert.amendoimTorrado);
    save(IngredientsInsert.carne);
    save(IngredientsInsert.cenoura);
    save(IngredientsInsert.chocolateEmPo);
    save(IngredientsInsert.farinhaDeTrigo);
    save(IngredientsInsert.fermento);
    save(IngredientsInsert.frango);
    save(IngredientsInsert.leite);
    save(IngredientsInsert.leiteCondesado);
    save(IngredientsInsert.manteiga);
    save(IngredientsInsert.massaDeTomate);
    save(IngredientsInsert.massaLasanha);
    save(IngredientsInsert.molhoBolonhesa);
    save(IngredientsInsert.molhoSaborPizza);
    save(IngredientsInsert.morango);
    save(IngredientsInsert.oleo);
    save(IngredientsInsert.oregano);
    save(IngredientsInsert.ovo);
    save(IngredientsInsert.pimentaDoReino);
    save(IngredientsInsert.presunto);
    save(IngredientsInsert.queijoFatiado);
    save(IngredientsInsert.queijoMussarela);
    save(IngredientsInsert.sal);
    save(IngredientsInsert.sorvete);
    save(IngredientsInsert.essenciaBaunilha);
    save(IngredientsInsert.cafeSoluvel);
    save(IngredientsInsert.agua);
  }

  Future<int> save(Ingredient ingredient) async {
    final Database db = await getDatabase();
    Map<String, dynamic> map = _toMap(ingredient);
    return db.insert(_tableIngredient, map);
  }

  Future<int> deleteTable() async {
    final Database db = await getDatabase();
    return db.delete(_tableIngredient);
  }

  Map<String, dynamic> _toMap(Ingredient ingredient) {
    final Map<String, dynamic> map = Map();
    map[_id] = ingredient.id;
    map[_name] = ingredient.name;
//    map[_have] = ingredient.have.toString();
    return map;
  }

  Future<List<Ingredient>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableIngredient);
    List<Ingredient> ingredients = _toList(result);
    return ingredients;
  }

  // REALIZA BUSCA NO DATABASE PELO NOME
  Future<List<Ingredient>> searchByName(String ingredient) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
    await db.query(_tableIngredient, where: "$_name LIKE '%${ingredient}%'");
    List<Ingredient> ingredients = _toList(result);
    return ingredients;
  }




  List _toList(List<Map<String, dynamic>> result) {
    final List<Ingredient> ingredients = List();
    for (Map<String, dynamic> row in result) {
      final Ingredient ingredient = Ingredient(
          id: row[_id],
          name: row[_name],
          listRecipes: row[_idRecipe],
//          have: row[_have]=='true'
      );
      ingredients.add(ingredient);
    }
    return ingredients;
  }


}
