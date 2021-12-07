import 'package:flutter/material.dart';
import 'package:mealsapp/helper/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/pages/filters_page.dart';
import 'package:mealsapp/pages/meal_details_page.dart';
import 'package:mealsapp/pages/tabs_page.dart';
import './pages/category_meals_page.dart';

import './pages/categories_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _avaialabelMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _avaialabelMeals = DUMMY_MEALS.where((meal) {
        if (_filters["gluten"]! && meal.isGlutenFree) {
          return false;
        }
        if (_filters["lactose"]! && meal.isLactoseFree) {
          return false;
        }
        if (_filters["vagan"]! && meal.isVegan) {
          return false;
        }
        if (_filters["vegetarian"]! && meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MealsApp",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 22,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
        ),
      ),
      initialRoute: CategoriesPage.routeName,
      routes: {
        CategoriesPage.routeName: (ctx) => const TabsPage(),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(availableMeals: _avaialabelMeals),
        MealDetailsPage.routeName: (ctx) => const MealDetailsPage(),
        FiltersPage.routeName: (ctx) => FiltersPage(
              saveFilters: _setFilters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const CategoriesPage());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const CategoriesPage());
      // },
    );
  }
}
