import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';

AppBar gradientAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
    ),
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            primaryColor(),
            secondGradientColor(),
          ],
        ),
      ),
    ),
  );
}
