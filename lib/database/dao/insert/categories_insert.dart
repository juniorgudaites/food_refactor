import 'package:food_refactor/models/category.dart';

class CategoriesInsert {
  static final Category bolos = Category(
    id: 1,
    name: 'Bolos',
    pathImage: 'assets/receitas/bolos/bolos.jpg',
  );
  static final Category doces = Category(
    id: 2,
    name: 'Doces',
    pathImage: 'assets/receitas/doces/doces.jpg',
  );
  static final Category massas = Category(
    id: 3,
    name: 'Massas',
    pathImage: 'assets/receitas/massas/massas.jpg',
  );
  static final Category bebidas = Category(
    id: 4,
    name: 'Bebidas',
    pathImage: 'assets/receitas/massas/bebidas.jpg',
  );
}
