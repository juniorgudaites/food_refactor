import 'package:flutter/material.dart';
import 'package:food_refactor/components/colors.dart';
import 'package:food_refactor/database/dao/recipes_dao.dart';
import 'package:food_refactor/views/search_recipes.dart';

class Search extends StatelessWidget {
  final TextEditingController _recipe = TextEditingController();
  final RecipesDao _dao = RecipesDao();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: secondColor(),width: 3.0),
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: TextField(
          onSubmitted: (value) => _showSearch(context),
          controller: _recipe,
          decoration: InputDecoration(
            hintText: 'Busque uma receita pelo nome',
            icon: Icon(
              Icons.search,
              size: 40.0,
              color: secondColor(),
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            fontSize: 20.0,
          ),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }

  // Route for Search
  _showSearch(BuildContext context) {
    if (_recipe.text != '' && _recipe.text != ' ') {
      if (_dao.searchByName(_recipe.text) != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RecipesListSearch(_dao.searchByName(_recipe.text)),
          ),
        );
      }
    }
  }
}
