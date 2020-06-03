import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/categories_dao.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/views/list_categories.dart';
import 'package:food_refactor/views/list_screen.dart';
import 'package:food_refactor/views/widgets/menu.dart';
import 'package:food_refactor/views/widgets/futureItem.dart';
import 'package:food_refactor/views/widgets/search_bar.dart';



class MenuDashboard extends StatefulWidget {
  @override
  _MenuDashboardState createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  RecipesDao _recipesDao = RecipesDao();
  CategoriesDao _categoriesDao = CategoriesDao();


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
            menu(context,_slideAnimation,_menuScaleAnimation),
            _dashboard(context),
          ],
        ),
      ),
    );
  }

//  Widget menu(context) {
//    return SlideTransition(
//      position: _slideAnimation,
//      child: ScaleTransition(
//        scale: _menuScaleAnimation,
//        child: Padding(
//          padding: const EdgeInsets.only(left: 16.0),
//          child: Align(
//            alignment: Alignment.centerLeft,
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Text("Dashboard",
//                    style: TextStyle(color: Colors.white, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Messages",
//                    style: TextStyle(color: Colors.white, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Utility Bills",
//                    style: TextStyle(color: Colors.white, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Funds Transfer",
//                    style: TextStyle(color: Colors.white, fontSize: 22)),
//                SizedBox(height: 10),
//                Text("Branches",
//                    style: TextStyle(color: Colors.white, fontSize: 22)),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }

  Widget _dashboard(context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16,right: 16, top:48),
                    child: Row(
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
                        Text("Food Refactor",
                            style: TextStyle(fontSize: 24, color: Colors.white)),
                        Icon(Icons.feedback, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                      padding: EdgeInsets.only(left: 16,right: 16),
                      child: Search()),
                  SizedBox(height: 60),
                  Center(
                    child: Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Image.asset(
                        'assets/logo.png',
                        width: 330,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 130,
                    child: ListView(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      controller: PageController(viewportFraction: 0.5),
                      scrollDirection: Axis.horizontal,
//                      pageSnapping: true,
                      children: <Widget>[
                        FutureItem(
                          Icons.book,
                          'Receitas',
                          onClick: () => _showList(context,title: 'Receitas',list: _recipesDao.findAll()),
                        ),
                        FutureItem(
                          Icons.view_list,
                          'Categorias',
                          onClick: () => _showCategoriesList(context,title: 'Categorias', list: _categoriesDao.findAll()),
                        ),
                        FutureItem(
                          Icons.filter_list,
                          'Ingredientes',
                          onClick: () => _showList(context,title:'Ingredientes', list: _recipesDao.findAll()),
                        ),
                        FutureItem(
                          Icons.favorite,
                          'Favoritos',
                          onClick: () => _showList(context,title: 'Favoritos', list: _recipesDao.searchFavorite()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCategoriesList(BuildContext context,{Future<List> list,String title}){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListCategories(title: title, list: list,),
      ),
    );
  }

  void _showList(BuildContext context,{Future<List> list,String title}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListScreen(title: title, list: list,),
      ),
    );
  }

}
