import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_refactor/database/app_database.dart';


class IngredientsDao {

  // Table Category
  static const String tableCategorySql = 'CREATE TABLE $_tableIngredient('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_idRecipe INTEGER)';

  static const String _tableIngredient = 'ingredients';
  static const String _id = 'idIngredient';
  static const String _name = 'nameIngredient';
  static const String _idRecipe = 'idRecipe';

  String getNameTableCategory() => _tableIngredient;

  Future<int> save(Category category) async {
    final Database db = await getDatabase();
    Map<String, dynamic> map = _toMap(category);
    return db.insert(_tableIngredient, map);
  }

  Future<int> deleteTable() async {
    final Database db = await getDatabase();
    return db.delete(_tableIngredient);
  }

  Map<String, dynamic> _toMap(Category category) {
    final Map<String, dynamic> map = Map();
    map[_id] = category.id;
    map[_name] = category.name;
    return map;
  }

  Future<List<Category>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableIngredient);
    List<Category> categories = _toList(result);
    return categories;
  }

  // DELETAR DEPOIS
  Future<List<Recipe>> searchCategoryByIdRecipe(int id) async {
    RecipesDao _daoRecipes = new RecipesDao();
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
        _daoRecipes.getNameTableRecipe(), where: "$_daoRecipes = $id%");
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  List _toList(List<Map<String, dynamic>> result) {
    final List<Category> categories = List();
    for (Map<String, dynamic> row in result) {
      final Category category = Category(
          id: row[_id],
          name: row[_name],
          idRecipe: row[_idRecipe]
      );
      categories.add(category);
    }
    return categories;
  }


}
