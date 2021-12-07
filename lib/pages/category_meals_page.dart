import 'package:flutter/material.dart';
import 'package:mealsapp/helper/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const String routeName = "/categories-meals";
  // final String catID;
  // final String catTitle;

  final List<Meal> availableMeals;

  const CategoryMealsPage({
    // required this.catID,
    // required this.catTitle,
    required this.availableMeals,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  bool _isLoadedInit = false;

  @override
  void initState() {
    //INITSTATE IS NOT ABLE TO RECOGNIZE CONTEXT AT A VERY INTIAL STAGE THAT IS WHY WE USE
    // didChangeDependencies

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isLoadedInit) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final String catID = routeArgs['id'] as String;
      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(catID))
          .toList();
      _isLoadedInit = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            removeMeal: _removeMeal,
            meal: displayedMeals![index],
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
