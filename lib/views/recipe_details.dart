import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/recipe.dart';


import 'widgets/menu.dart';


class RecipeDetails extends StatefulWidget {
  Recipe recipe;

  RecipeDetails(this.recipe);

  @override
  _RecipeDetailsState createState() => _RecipeDetailsState();

}

class _RecipeDetailsState extends State<RecipeDetails> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColorMenu(),
      body: GestureDetector(
        onTap: () {
          // call this method here to hide soft keyboard
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            if (!isCollapsed) {
              _controller.reverse();
              isCollapsed = !isCollapsed;
            }
          });
        },
        child: Stack(
          children: <Widget>[
            menu(context,_slideAnimation,_menuScaleAnimation),
            _screen(context),
          ],
        ),
      ),
      floatingActionButton: _buttonFavorite(),
    );
  }

  Widget _buttonFavorite(){
   return FloatingActionButton(
        child: _showIconFavorite(),
        backgroundColor: primaryGradientColor(),
        onPressed: () {
          _toggleFavorite();
          setState(() {
            RecipeDetails(widget.recipe);
          });
          debugPrint(widget.recipe.toString());
        });
  }

  Widget _screen(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 8,
          color: backgroundColor(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text(widget.recipe.name,
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.feedback, color: Colors.white),
                    ],
                  ),
                  _image(),
                  _ingredientsTitle(),
                  _ingredientsText(),
                  _preparationModeTitle(),
                  _preparationModeText(),
                  SizedBox(height:60),
                ],
              ),
            ),
          ),
        ),
      ),
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
          color: secondColor(),
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget _ingredientsText() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Container(
        width: screenWidth,
        child: Text(
          '${widget.recipe.listIngredients}',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
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
          color: secondColor(),
          fontSize: 24.0,
        ),
      ),
    );
  }

  Widget _preparationModeText(){
    return  Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Container(
        width: screenWidth,
        child: Text(
          '${widget.recipe.preparationMode}',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
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
      _showAlertMessage("Removida dos Favoritos");
    } else {
      widget.recipe.favorite = 1;
      _dao.updateFavorite(widget.recipe);
      _showAlertMessage("Adicionada aos Favoritos");
    }
  }

  void _showAlertMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          content: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            IconButton(
              icon: Icon(Icons.close),
              color: Colors.white,
              iconSize: 36.0,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: alertDialogBackgroundColor(),
        );
      },
    );
  }

}
