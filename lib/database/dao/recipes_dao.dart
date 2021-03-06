import 'package:food_refactor/database/dao/insert/recipes_insert.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:food_refactor/views/list_ingredients.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_refactor/database/app_database.dart';
import 'package:food_refactor/models/recipe.dart';

class RecipesDao {
  // TABLE RECIPES
  static const String tableRecipeSql = 'CREATE TABLE $_tableRecipes('
//      '$_id INTEGER PRIMARY KEY AUTOINCREMENT, '
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_description TEXT, '
      '$_ingredients TEXT, '
      '$_preparationMode TEXT, '
      '$_category TEXT, '
      '$_favorite INTEGER, '
      '$_pathImage TEXT)';

  static const String _tableRecipes = 'recipes';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _description = 'description';
  static const String _ingredients = 'ingredients';
  static const String _preparationMode = 'preparationMode';
  static const String _category = 'category';
  static const String _favorite = 'favorite';
  static const String _pathImage = '_pathImage';

  String getNameTableRecipe() => _tableRecipes;

  insert() {
    save(RecipesInsert.boloChocolate);
    save(RecipesInsert.boloCenoura);
    save(RecipesInsert.brigadeiro);
    save(RecipesInsert.peDeMoleque);
    save(RecipesInsert.lasanha);
    save(RecipesInsert.pizza);
    save(RecipesInsert.cafeCremoso);
    save(RecipesInsert.milkShake);
    save(RecipesInsert.vitaminaMorango);
  }

  // INSERE OBJETO RECIPE NO DATABASE
  Future<int> save(Recipe recipe) async {
    final Database db = await getDatabase();
    Map<String, dynamic> map = _toMap(recipe);
    return db.insert(_tableRecipes, map);
  }

  // DELETA TABELA RECIPES
  Future<int> deleteTable() async {
    final Database db = await getDatabase();
    return db.delete(_tableRecipes);
  }

  // RETORNA TODAS AS RECEITAS DO DATABASE
  Future<List<Recipe>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableRecipes);
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  // REALIZA BUSCA NO DABASE PELO NOME
  Future<List<Recipe>> searchByName(String recipe) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableRecipes, where: _queryLikeSeach(recipe));
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  Future<List<Recipe>> searchIngredient(List<Ingredient> list) async{
    String queryWhere;
    if (list.length == 1) {
      queryWhere = "$_ingredients LIKE '%${list[0].name}%'";
    } else {
      queryWhere = "$_ingredients LIKE '%${list[0].name}%'";
      for (int i = 1; i < list.length; i++) {
        queryWhere += "OR $_ingredients LIKE '%${list[i].name}%'";
      }
    }
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableRecipes, where: queryWhere);
    List<Recipe> recipes = _toList(result);
    ListIngredients.listIngredientsHave.clear();
    return recipes;
  }

  /* METODO RETORNA QUERY DA BARRA DE BUSCA;
  REALIZA SPLIT DA STRING E TRATANDO PRONOMES DE CONJUNÇÃO*/
  String _queryLikeSeach(String recipe) {
    List<String> list = recipe.split(' ');
    String queryWhere;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == 'de' ||
          list[i] == 'ou' ||
          list[i] == 'com' ||
          list[i] == 'e') {
        list.removeAt(i);
      }
    }
    if (list.length == 1) {
      queryWhere = "$_name LIKE '%${list[0]}%'";
    } else {
      queryWhere = "$_name LIKE '%${list[0]}%'";
      for (int i = 1; i < list.length; i++) {
        queryWhere += "AND $_name LIKE '%${list[i]}%'";
      }
    }
    return queryWhere;
  }

  // RETORNA LISTA DE RECEITAS FAVORITAS
  Future<List<Recipe>> searchFavorite() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableRecipes, where: '$_favorite = 1');
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  // ATUALIZA O STATUS FAVORITO NO DATABASE
  updateFavorite(Recipe recipe) async {
    final Database db = await getDatabase();
    Map<String, dynamic> map = _toMap(recipe);
    db.update(_tableRecipes, map, where: '$_id = ?', whereArgs: [recipe.id]);
  }

  // REALIZA BUSCA NO DB PELO ID
  Future<List<Recipe>> searchById(int id) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableRecipes, where: '$_id = $id');
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  // REALIZA BUSCA DE CATEGORIA NO DB - DELETER FUTURAMENTE
  Future<List<Recipe>> searchCategoryByName(String category) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(_tableRecipes, where: "$_category LIKE '%$category%'");
    List<Recipe> recipes = _toList(result);
    return recipes;
  }

  // TRANSFORMA OS DADOS DO DB PARA O OBJETO
  List _toList(List<Map<String, dynamic>> result) {
    final List<Recipe> recipes = List();
    for (Map<String, dynamic> row in result) {
      final Recipe recipe = Recipe(
          id: row[_id],
          name: row[_name],
          description: row[_description],
          preparationMode: row[_preparationMode],
          category: row[_category],
          listIngredients: row[_ingredients],
          favorite: row[_favorite],
          pathImage: row[_pathImage]);
      recipes.add(recipe);
    }
    return recipes;
  }

  // REALIZA O MAP DO OBJETO RECIPE PARA O DATABASE
  Map<String, dynamic> _toMap(Recipe recipe) {
    final Map<String, dynamic> map = Map();
    map[_id] = recipe.id;
    map[_name] = recipe.name;
    map[_description] = recipe.description;
    map[_ingredients] = recipe.listIngredients.toString();
    map[_preparationMode] = recipe.preparationMode;
    map[_category] = recipe.category;
    map[_favorite] = recipe.favorite;
    map[_pathImage] = recipe.pathImage;
    return map;
  }
}
