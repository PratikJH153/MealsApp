import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = "/meal-details";
  const MealDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealID),
      ),
      body: Center(
        child: Text("The meal id $mealID"),
      ),
    );
  }
}
