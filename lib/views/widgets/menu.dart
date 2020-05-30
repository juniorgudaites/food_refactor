import 'package:flutter/material.dart';

Widget menu(context,_slideAnimation,_menuScaleAnimation) {
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
              Text("Dashboard 2.0",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: 10),
              Text("Messages",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: 10),
              Text("Utility Bills",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: 10),
              Text("Funds Transfer",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              SizedBox(height: 10),
              Text("Branches",
                  style: TextStyle(color: Colors.white, fontSize: 22)),
            ],
          ),
        ),
      ),
    ),
  );
}