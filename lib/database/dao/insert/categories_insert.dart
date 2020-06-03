import 'package:food_refactor/models/category.dart';

class CategoriesInsert {
  static final Category bolos = Category(
    name: 'Bolos',
    id: 1,
    pathImage: 'assets/receitas/bolos/bolos.png',
  );
  static final Category doces = Category(
    name: 'Doces',
    id: 2,
    pathImage: 'assets/receitas/doces/doces.png',
  );
  static final Category massas = Category(
    name: 'Massas',
    id: 3,
    pathImage: 'assets/receitas/massas/massas.png',
  );
}
