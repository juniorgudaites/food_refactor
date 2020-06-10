import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/ingredients_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {

  final String path = join(await getDatabasesPath(), 'food_refactor.dp');
//  await deleteDatabase(path);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(RecipesDao.tableRecipeSql);
      db.execute(CategoriesDao.tableCategorySql);
      db.execute(IngredientsDao.tableIngredientSql);
    },
    version: 1,
//   onDowngrade: onDatabaseDowngradeDelete,
  );


}
