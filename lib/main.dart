import 'package:flutter/material.dart';
import 'package:mealsapp/pages/filters_page.dart';
import 'package:mealsapp/pages/meal_details_page.dart';
import 'package:mealsapp/pages/tabs_page.dart';
import './pages/category_meals_page.dart';

import './pages/categories_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        CategoryMealsPage.routeName: (ctx) => const CategoryMealsPage(),
        MealDetailsPage.routeName: (ctx) => const MealDetailsPage(),
        FiltersPage.routeName: (ctx) => const FiltersPage(),
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
