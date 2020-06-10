import 'package:food_refactor/database/dao/insert/categories_insert.dart';
import 'package:food_refactor/models/ingredient.dart';
import 'package:food_refactor/models/recipe.dart';

class RecipesInsert {
  static final Recipe boloChocolate = Recipe(
      name: 'Bolo de Chocolate',
      description: 'Bolo de Chocolate com cobertura de chocolate',
      listIngredients: Ingredient(name: 'Ovo', quantity: '4').toString() +
          '\n' +
          Ingredient(name: 'Chocolate em Pó', quantity: '4 Colheres(Sopa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Manteiga', quantity: '2 Colheres(Sopa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Farinha de Trigo', quantity: '3 Xícaras(Chá)')
              .toString() +
          '\n' +
          Ingredient(name: 'Açúcar', quantity: '2 Xícaras(Chá)').toString() +
          '\n' +
          Ingredient(name: 'Leite', quantity: '1 Xícara(Chá)').toString() +
          '\n' +
          Ingredient(name: 'Fermento', quantity: '2 Colheres(Sopa)').toString(),
      preparationMode:
          'Em um liquidificador adicione os ovos, o chocolate em pó, a manteiga, a farinha de trigo, o açúcar e o leite, depois bata por 5 minutos.\n' +
              'Adicione o fermento e misture com uma espátula delicadamente.\n' +
              'Em uma forma untada, despeje a massa e asse em forno médio (180 ºC) preaquecido por cerca de 40 minutos. Não se esqueça de usar uma forma alta para essa receita: como leva duas colheres de fermento, ela cresce bastante! Outra solução pode ser colocar apenas uma colher de fermento e manter a sua receita em uma forma pequena.',
      category: CategoriesInsert.bolos.name,
      pathImage: 'assets/receitas/bolos/bolo_de_chocolate.jpg',
      id: 1);

  static final Recipe boloCenoura = Recipe(
      name: 'Bolo de Cenoura',
      description: 'Bolo de Cenoura com cobertura de chocolate',
      listIngredients: Ingredient(name: 'Ovo', quantity: '4').toString() +
          '\n' +
          Ingredient(name: 'Chocolate em Pó', quantity: '4 Colheres(Sopa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Cenoura', quantity: '3').toString() +
          '\n' +
          Ingredient(name: 'Óleo', quantity: '1/2  Xícara(Chá)').toString() +
          '\n' +
          Ingredient(name: 'Farinha de Trigo', quantity: '2 Xícaras(Chá)')
              .toString() +
          '\n' +
          Ingredient(name: 'Açúcar', quantity: '2 Xícaras(Chá)').toString() +
          '\n' +
          Ingredient(name: 'Fermento', quantity: '1 Colher(Sopa)').toString(),
      preparationMode:
          'Em um liquidificador, adicione a cenoura, os ovos e o óleo, depois misture.\n' +
              'Acrescente o açúcar e bata novamente por 5 minutos.\n' +
              'Em uma tigela ou na batedeira, adicione a farinha de trigo e depois misture novamente.\n' +
              'Acrescente o fermento e misture lentamente com uma colher.\n' +
              'Asse em um forno preaquecido a 180° C por aproximadamente 40 minutos.',
      category: CategoriesInsert.bolos.name,
      pathImage: 'assets/receitas/bolos/bolo_de_cenoura.jpg',
      id: 2);

  static final Recipe brigadeiro = Recipe(
      name: 'Brigadeiro',
      description: 'Doce de Brigadeiro na panela',
      listIngredients: Ingredient(
                  name: 'Chocolate em Pó', quantity: '7 Colheres(Sopa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Leite Condensado', quantity: '1').toString() +
          '\n' +
          Ingredient(name: 'Manteiga', quantity: '1 Colher(Sopa)').toString(),
      preparationMode:
          'Em uma panela funda, acrescente o leite condensado, a margarina e o chocolate em pó.\n' +
              'Cozinhe em fogo médio e mexa até que o brigadeiro comece a desgrudar da panela.',
      category: CategoriesInsert.doces.name,
      pathImage: 'assets/receitas/doces/brigadeiro.jpg',
      id: 3);

  static final Recipe peDeMoleque = Recipe(
      name: 'Pé-de-Moleque',
      description: 'Rapadura Pé-de-Moleque feita com amendoim',
      listIngredients: Ingredient(name: 'Amendoim Torrado', quantity: '1/2 kg')
              .toString() +
          '\n' +
          Ingredient(name: 'Açúcar', quantity: '1/2 kg').toString() +
          '\n' +
          Ingredient(name: 'Margarina', quantity: '3 Colheres(Sopa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Leite Condesado', quantity: '1 Lata').toString(),
      preparationMode: 'Colocar na panela o amendoim, o açúcar e a margarina.\n' +
          'Levar ao fogo, mexendo sempre.\n' +
          'Quando começar a formar uma calda, coloque o leite condensado.\n' +
          'Mexa bem, até soltar do fundo da panela, como brigadeiro.\n' +
          'Coloque no tabuleiro untado com margarina.\n' +
          'Deixe esfriar e corte em pedaços.',
      category: CategoriesInsert.doces.name,
      pathImage: 'assets/receitas/doces/pe_de_moleque.jpg',
      id: 4);

  static final Recipe lasanha = Recipe(
      name: 'Lasanha',
      description: 'Lasanha Tradiocional de Presunto, Queijo e Carne',
      listIngredients: Ingredient(
                  name: 'Massa de Lasanha', quantity: '1 Pacote')
              .toString() +
          '\n' +
          Ingredient(name: 'Presunto', quantity: '500g').toString() +
          '\n' +
          Ingredient(name: 'Queijo Mussarela', quantity: '500g').toString() +
          '\n' +
          Ingredient(name: 'Carne', quantity: '500g').toString() +
          '\n' +
          Ingredient(name: 'Massa de Tomate', quantity: '1 Pacote').toString() +
          '\n' +
          Ingredient(name: 'Sal', quantity: 'a gosto').toString() +
          '\n' +
          Ingredient(name: 'Pimenta-do-reino', quantity: 'a gosto').toString() +
          '\n' +
          Ingredient(name: 'Orégano', quantity: 'a gosto').toString(),
      preparationMode:
          'Cozinhe a massa da lasanha em aproximadamente em 2 litros de água por 5 minutos.\n' +
              'Em uma panela cozinhe a carne moída, depois de cozida coloque molho de tomate, o sal e temperos a gosto.\n' +
              'Comece montando com uma camada de molho, a massa da lasanha, o presunto e o queijo.\n' +
              'Faça esse processo até tudo terminar.\n' +
              'Aqueça o forno a 180º C durante 5 minutos.\n' +
              'Coloque a lasanha no forno de 20 a 30 minutos.',
      category: CategoriesInsert.massas.name,
      pathImage: 'assets/receitas/massas/lasanha.jpg',
      id: 5);

  static final Recipe pizza = Recipe(
      name: 'Pizza',
      description: 'Pizza de Frango',
      listIngredients: Ingredient(name: 'Leite', quantity: '1 Xícaras(Chá)')
              .toString() +
          '\n' +
          Ingredient(name: 'Farinha de trigo', quantity: '2 Xícaras(Chá)')
              .toString() +
          '\n' +
          Ingredient(name: 'Fermento', quantity: '1 Colher(Sobremesa)')
              .toString() +
          '\n' +
          Ingredient(name: 'Óleo', quantity: '2 Colheres(Sopa)').toString() +
          '\n' +
          Ingredient(name: 'Sal', quantity: '1 pitada').toString() +
          '\n' +
          Ingredient(name: 'Molho sabor pizza', quantity: '1 sachê')
              .toString() +
          '\n' +
          Ingredient(name: 'Molho à bolonhesa', quantity: '1 sachê')
              .toString() +
          '\n' +
          Ingredient(name: 'Frango', quantity: '1 peito').toString() +
          '\n' +
          Ingredient(name: 'Fatias de Queijo', quantity: '10').toString(),
      preparationMode: 'Misture o leite, a farinha e o fermento em uma bacia.\n' +
          'Depois misture o óleo e o sal com os ingredientes anteriores até virar uma massa grossa.\n' +
          'Abra em uma forma de pizza redonda.\n'
              'Misture o molho de pizza com o molho à bolonhesa em um pote, tampe e coloque na geladeira.\n' +
          'Coloque o molho sobre a massa.\n' +
          'Coloque o queijo em cima do molho.Cozinhe o frango com o tomate, pimentão e cebola.\n' +
          'Quando estiver cozido desfie e coloque na pizza.\n' +
          'Polvilhe orégano.\n' +
          'Asse no forno por 20 minuto a 280ºC.',
      category: CategoriesInsert.massas.name,
      pathImage: 'assets/receitas/massas/pizza.jpg',
      id: 6);
}
