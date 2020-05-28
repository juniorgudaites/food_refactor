import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/views/category_list.dart';
import 'package:food_refactor/views/favorite_list.dart';
import 'package:food_refactor/views/recipe_list.dart';
import 'package:food_refactor/views/widgets/futureItem.dart';
import 'package:food_refactor/views/widgets/search_bar.dart';



class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> with SingleTickerProviderStateMixin {

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
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
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
        },
        child: Stack(
          children: <Widget>[
            menu(context),
            dashboard(context),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Dashboard", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Messages", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Utility Bills", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Funds Transfer", style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Branches", style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
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
                      Text("Food Refactor", style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.feedback, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 20),
                  Search(),
                  SizedBox(height: 50),
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 330,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 130,
                    child: ListView(
                      controller: PageController(viewportFraction: 0.5),
                      scrollDirection: Axis.horizontal,
//                      pageSnapping: true,
                      children: <Widget>[
                        FutureItem(
                          Icons.book,
                          'Receitas',
                          onClick: () => _showRecipesList(context),
                        ),
                        FutureItem(
                          Icons.view_list,
                          'Categorias',
                          onClick: () => _showCategoryList(context),
                        ),
                        FutureItem(
                          Icons.filter_list,
                          'Ingredientes',
                          onClick: () => _showRecipesList(context),
                        ),
                        FutureItem(
                          Icons.favorite,
                          'Favoritos',
                          onClick: () => _showFavoriteList(context),
                        ),
                      ],
                    ),
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
