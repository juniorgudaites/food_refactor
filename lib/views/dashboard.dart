import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/views/category_list.dart';
import 'package:food_refactor/views/favorite_list.dart';
import 'package:food_refactor/views/recipe_list.dart';
import 'file:///D:/Google%20Drive/Anhembi%20Morumbi/TCC/food_refactor/lib/views/widgets/search_bar.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Food Refactor'),),
      appBar: gradientAppBar('Food Refactor'),
      body: GestureDetector(
        onTap: () {
          // call this method here to hide soft keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //Alinhamento Vertical
              crossAxisAlignment: CrossAxisAlignment.start,
              //Alinhamento Horizontal
              children: <Widget>[
                Search(),
                Padding(
                  padding: const EdgeInsets.only(top:16.0,left: 16.0,right: 16.0),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 330,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _FutureItem(
                              Icons.book,
                              'Receitas',
                              onClick: () => _showRecipesList(context),
                            ),
                            _FutureItem(
                              Icons.view_list,
                              'Categorias',
                              onClick: () => _showCategoryList(context),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _FutureItem(
                              Icons.filter_list,
                              'Ingredientes',
                              onClick: () => _showRecipesList(context),
                            ),
                            _FutureItem(
                              Icons.favorite,
                              'Favoritos',
                              onClick: () => _showFavoriteList(context),
                            ),
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRecipesList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RecipesList(),
      ),
    );
  }

  void _showCategoryList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryList(),
      ),
    );
  }

  void _showFavoriteList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FavoriteList(),
      ),
    );
  }
}

// Botão utilizado no Dashboard
class _FutureItem extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final Function onClick;

  _FutureItem(
    this._icon,
    this._text, {
    @required this.onClick,
  })  : assert(_icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          //é utilizado para atribuir gestos a qualquer widget
          onTap: () => onClick(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                colors: <Color>[
                  secondGradientColor(),
                  primaryColor(),
                ],
              ),
            ),
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //Alinhamento Vertical
              crossAxisAlignment: CrossAxisAlignment.start,
              //Alinhamento Horizontal
              children: <Widget>[
                Icon(
                  _icon,
                  //color: Colors.green[600],
                  color : Color.fromARGB(255,118, 182, 47),
                  size: 48.0,
                ),
                Text(
                  _text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
