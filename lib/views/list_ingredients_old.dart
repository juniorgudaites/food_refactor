//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:food_refactor/components/centered_message.dart';
//import 'package:food_refactor/components/colors.dart';
//import 'package:food_refactor/components/progress.dart';
//import 'package:food_refactor/models/ingredient.dart';
//
//import 'widgets/menu.dart';
//
//class ListIngredients extends StatefulWidget {
//  Future<List> list;
//  String title;
//
//  ListIngredients({@required this.title, @required this.list});
//
//  @override
//  _ListState createState() => _ListState();
//}
//
//class _ListState extends State<ListIngredients>
//    with SingleTickerProviderStateMixin {
//  bool isCollapsed = true;
//  double screenWidth, screenHeight;
//  final Duration duration = const Duration(milliseconds: 300);
//  AnimationController _controller;
//  Animation<double> _scaleAnimation;
//  Animation<double> _menuScaleAnimation;
//  Animation<Offset> _slideAnimation;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(vsync: this, duration: duration);
//    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
//    _menuScaleAnimation =
//        Tween<double>(begin: 0.5, end: 1).animate(_controller);
//    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
//        .animate(_controller);
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
//    screenHeight = size.height;
//    screenWidth = size.width;
//
//    return Scaffold(
//      backgroundColor: backgroundColorMenu(),
//      body: GestureDetector(
//        onTap: () {
//          // call this method here to hide soft keyboard
//          FocusScope.of(context).requestFocus(FocusNode());
//          setState(() {
//            if (!isCollapsed) {
//              _controller.reverse();
//              isCollapsed = !isCollapsed;
//            }
//          });
//        },
//        child: Stack(
//          children: <Widget>[
//            menu(context, _slideAnimation, _menuScaleAnimation),
//            _screen(context),
//          ],
//        ),
//      ),
////      floatingActionButton: _buttonFilter(),
//    );
//  }
//
//  Widget _buttonFilter() {
//    return FloatingActionButton(
//        child: Icon(Icons.search, color: Colors.white, size: 42.0),
//        backgroundColor: primaryGradientColor(),
//        onPressed: () {});
//  }
//
//  Widget _screen(context) {
//    return AnimatedPositioned(
//      duration: duration,
//      top: 0,
//      bottom: 0,
//      left: isCollapsed ? 0 : 0.6 * screenWidth,
//      right: isCollapsed ? 0 : -0.2 * screenWidth,
//      child: ScaleTransition(
//        scale: _scaleAnimation,
//        child: Material(
//          animationDuration: duration,
//          borderRadius: BorderRadius.all(Radius.circular(10)),
//          elevation: 8,
//          color: backgroundColor(),
//          child: SingleChildScrollView(
//            scrollDirection: Axis.vertical,
//            physics: ClampingScrollPhysics(),
//            child: Container(
//              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    mainAxisSize: MainAxisSize.max,
//                    children: [
//                      InkWell(
//                        child: Icon(Icons.menu, color: Colors.white),
//                        onTap: () {
//                          setState(() {
//                            if (isCollapsed)
//                              _controller.forward();
//                            else
//                              _controller.reverse();
//
//                            isCollapsed = !isCollapsed;
//                          });
//                        },
//                      ),
//                      Text(widget.title,
//                          style: TextStyle(fontSize: 24, color: Colors.white)),
//                      Icon(Icons.feedback, color: Colors.white),
//                    ],
//                  ),
//                  Container(
//                    height: screenHeight,
//                    child: _builder(),
//                  ),
//                  SizedBox(height: 20),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _builder() {
//    return FutureBuilder<List<Ingredient>>(
//      initialData: List(),
//      future: widget.list,
//      builder: (context, snapshot) {
//        switch (snapshot.connectionState) {
//          case ConnectionState.none:
//            break;
//          case ConnectionState.waiting:
//            return Progress();
//            break;
//          case ConnectionState.active:
//            break;
//          case ConnectionState.done:
//            final List<Ingredient> ingredients = snapshot.data;
//            return ListView.separated(
//              scrollDirection: Axis.vertical,
//              itemBuilder: (context, index) {
//                final Ingredient ingredient = ingredients[index];
//                return _checkList(context, ingredient);
//              },
//              separatorBuilder: (context, index) {
//                return Divider(height: 16);
//              },
//              itemCount: ingredients.length,
//            );
//            break;
//        }
//        return CenteredMessage('Unknown error');
//      },
//    );
//  }
//
//  Widget _checkList(context, Ingredient ingredient) {
//    if (ingredient.have) {
//      debugPrint('${ingredient.name}: ${ingredient.have.toString()}');
//    }
//    return SizedBox(
//      height: 30,
//      child: Row(
//        children: <Widget>[
//          Checkbox(
//            onChanged: (bool value) {
//              setState(() {
//                ingredient.have = value;
//              });
//            },
//            value: ingredient.have,
//          ),
//          Text(
//            ingredient.name,
//            style: TextStyle(color: primaryColor(),fontSize: 24.0,fontWeight: FontWeight.bold),
//          ),
//        ],
//      ),
//    );
//  }
//}
