// Botão utilizado no Dashboard
import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';

class FutureItem extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final Function onClick;

  FutureItem(
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
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                colors: <Color>[
                  secondGradientColor(),
                  primaryGradientColor(),
                ],
              ),
            ),
            padding: EdgeInsets.all(8.0),
            height: 150,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //Alinhamento Vertical
              crossAxisAlignment: CrossAxisAlignment.start,
              //Alinhamento Horizontal
              children: <Widget>[
                Icon(
                  _icon,
                  //color: Colors.green[600],
                  color : itemIconColor(),
                  size: 50.0,
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