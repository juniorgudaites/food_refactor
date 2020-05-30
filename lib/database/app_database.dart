import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/insert/recipes_insert.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  RecipesDao recipesDao = RecipesDao();
    
  

  final String path = join(await getDatabasesPath(), 'food_refactor.dp');
//  await deleteDatabase(path);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(RecipesDao.tableRecipeSql);
      db.execute(CategoriesDao.tableCategorySql);
//      db.execute(RecipesDao.insertRecipeSql);
//      db.execute(RecipesDao.insertTable(RecipesInsert.boloChocolate));
//      db.execute(RecipesDao.insertTable(RecipesInsert.brigadeiro));
//      db.execute(RecipesDao.insertRecipeSql);
//      recipesDao.insert();
//      recipesDao.save(RecipesInsert.boloChocolate);
//      recipesDao.save(RecipesInsert.boloCenoura);
//      recipesDao.save(RecipesInsert.brigadeiro);
    },
    version: 1,
//   onDowngrade: onDatabaseDowngradeDelete,
  );


}
