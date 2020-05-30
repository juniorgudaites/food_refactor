import 'package:food_refactor/database/dao/insert/categories_insert.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/models/recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_refactor/database/app_database.dart';


class CategoriesDao {

  // Table Category
  static const String tableCategorySql = 'CREATE TABLE $_tableCategory('
      '$_idCategory INTEGER PRIMARY KEY, '
      '$_nameCategory TEXT, '
      '$_idRecipe INTEGER)';
  //'$_idRecipeCategory INTEGER CONSTRAINT $_idRecipeCategory REFERENCES $_tableRecipes($_idRecipe))';

  static const String _tableCategory = 'categories';
  static const String _idCategory = 'idCategory';
  static const String _nameCategory = 'nameCategory';
  static const String _idRecipe = 'idRecipe';

  String getNameTableCategory() => _tableCategory;

  insert(){
    save(CategoriesInsert.bolos);
    save(CategoriesInsert.doces);
  }

  Future<int> save(Category category) async {
    final Database db = await getDatabase();
    Map<String, dynamic> map = _toMap(category);
    return db.insert(_tableCategory, map);
  }

  Future<int> deleteTable() async {
    final Database db = await getDatabase();
    return db.delete(_tableCategory);
  }

  Map<String, dynamic> _toMap(Category category) {
    final Map<String, dynamic> map = Map();
    map[_idCategory] = category.id;
    map[_nameCategory] = category.name;
    return map;
  }

  Future<List<Category>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableCategory);
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
        id: row[_idCategory],
        name: row[_nameCategory],
        idRecipe: row[_idRecipe]
      );
      categories.add(category);
    }
    return categories;
  }


}
