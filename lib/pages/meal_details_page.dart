import 'package:flutter/material.dart';
import 'package:mealsapp/helper/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = "/meal-details";
  const MealDetailsPage({Key? key}) : super(key: key);

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)!.settings.arguments as String;
    final Meal _selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedMeal.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealID);
        },
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                _selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, "Ingredients"),
            _buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 10,
                    ),
                    child: Text(_selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: _selectedMeal.ingredients.length,
              ),
            ),
            _buildSectionTitle(context, "Steps"),
            _buildContainer(
              child: ListView.builder(
                itemCount: _selectedMeal.steps.length,
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(
                    _selectedMeal.steps[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
