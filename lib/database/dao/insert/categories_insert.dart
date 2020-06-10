import 'package:food_refactor/models/category.dart';

class CategoriesInsert {
  static final Category bolos = Category(
    id: 1,
    name: 'Bolos',
    pathImage: 'assets/receitas/bolos/bolos.png',
  );
  static final Category doces = Category(
    id: 2,
    name: 'Doces',
    pathImage: 'assets/receitas/doces/doces.png',
  );
  static final Category massas = Category(
    id: 3,
    name: 'Massas',
    pathImage: 'assets/receitas/massas/massas.png',
  );
}
