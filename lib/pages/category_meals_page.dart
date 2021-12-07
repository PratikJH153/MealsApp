import 'package:flutter/material.dart';
import 'package:mealsapp/helper/dummy_data.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  static const String routeName = "/categories-meals";
  // final String catID;
  // final String catTitle;

  const CategoryMealsPage({
    // required this.catID,
    // required this.catTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String catTitle = routeArgs['title'] as String;
    final String catID = routeArgs['id'] as String;
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(catID)).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(meal: categoryMeals[index]);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
