import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/components/gradient_appbar.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/recipe.dart';

class RecipeDetails extends StatefulWidget {
  Recipe recipe;

  RecipeDetails(this.recipe);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar(widget.recipe.name),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _image(),
          _ingredientsTitle(),
          _ingredientsText(),
          _preparationModeTitle(),
          _preparationModeText(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: _showIconFavorite(),
          backgroundColor: secondColor(),
          onPressed: () {
            _toggleFavorite();
            setState(() {
              RecipeDetails(widget.recipe);
            });
            debugPrint(widget.recipe.toString());
          }),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: Image.asset(
        widget.recipe.pathImage,
        height: 200,
      )),
    );
  }

  Widget _ingredientsTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
      child: Text(
        "Ingredientes:",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryColor(),
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget _ingredientsText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Text(
        '${widget.recipe.listIngredients}',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromARGB(255, 73, 110, 35),
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget _preparationModeTitle(){
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 16.0),
      child: Text(
        "Modo de Preparo:",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: primaryColor(),
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget _preparationModeText(){
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Text(
        '${widget.recipe.preparationMode}',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color.fromARGB(255, 73, 110, 35),
          fontSize: 20.0,
        ),
      ),
    );
  }

  Icon _showIconFavorite() {
    if (widget.recipe.favorite == 1) {
      return Icon(
        Icons.favorite,
        color: Colors.white,
        size: 42.0,
      );
    } else {
      return Icon(
        Icons.favorite_border,
        color: Colors.white,
        size: 42.0,
      );
    }
  }

  void _toggleFavorite() {
    RecipesDao _dao = new RecipesDao();
    if (widget.recipe.favorite == 1) {
      widget.recipe.favorite = 0;
      _dao.updateFavorite(widget.recipe);
      _showAlertMessage("Receita Removida dos Favoritos");
    } else {
      widget.recipe.favorite = 1;
      _dao.updateFavorite(widget.recipe);
      _showAlertMessage("Receita Adicionada aos Favoritos");
    }
  }

  void _showAlertMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          backgroundColor: secondColor(),
          content: new Text(
            message,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              backgroundColor: secondColor(),
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            new IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              iconSize: 36.0,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
