import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_refactor/components/centered_message.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/components/progress.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/models/category.dart';
import 'package:food_refactor/views/list_recipes.dart';

import 'widgets/menu.dart';

class ListCategories extends StatefulWidget {
  Future<List> list;
  String title;

  ListCategories({@required this.title, @required this.list});

  @override
  _ListCategoriesState createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories>
    with SingleTickerProviderStateMixin {
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
    Size size = MediaQuery.of(context).size;
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
            menu(context, _slideAnimation, _menuScaleAnimation),
            _screen(context),
          ],
        ),
      ),
    );
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
                      Text(widget.title,
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.feedback, color: Colors.white),
                    ],
                  ),
                  Container(
                    height: double.maxFinite,
                    child: _builder(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _builder() {
    return FutureBuilder<List<Category>>(
      initialData: List(),
      future: widget.list,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return Progress();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            final List<Category> categories = snapshot.data;
            return ListView.separated(
              itemBuilder: (context, index) {
                final Category category = categories[index];
                return _card(context, category);
              },
              separatorBuilder: (context, index) {
                return Divider(height: 16);
              },
              itemCount: categories.length,
            );
            break;
        }
        return CenteredMessage('Unknown error');
      },
    );
  }

  Widget _card(context, category) {
    RecipesDao _dao = RecipesDao();
    return SizedBox(
      height: 80,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListRecipes(
                  title: category.name,
                  list: _dao.searchCategoryByName(category.name),
                ),
              ),
            );
          },
          child: Card(
            color: listTileColor(),
            child: ListTile(
              title: Text(
                category.name,
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
