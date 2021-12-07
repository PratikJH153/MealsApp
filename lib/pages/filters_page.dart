import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = "/filters";

  final Function saveFilters;

  const FiltersPage({
    required this.saveFilters,
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _isGlutenFree = false;
  bool _isvegetarian = false;
  bool _isvegan = false;
  bool _isLactoseFree = false;

  Widget _buildSwitchListTile({
    required String title,
    required String des,
    required Function updateValue,
    required bool currentValue,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (val) => updateValue(val),
      title: Text(title),
      subtitle: Text(des),
    );
  }

  void _updateFilters() {
    widget.saveFilters(
      {
        'gluten': _isGlutenFree,
        'lactose': _isLactoseFree,
        'vegan': _isvegan,
        'vegetarian': _isvegetarian,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Meals"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updateFilters,
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile(
                title: "Gluten-Free",
                des: "Only include gluten-free meals.",
                currentValue: _isGlutenFree,
                updateValue: (val) {
                  setState(() {
                    _isGlutenFree = val;
                  });
                },
              ),
              _buildSwitchListTile(
                title: "Lactose-Free",
                des: "Only include lactose-free meals.",
                currentValue: _isLactoseFree,
                updateValue: (val) {
                  setState(() {
                    _isLactoseFree = val;
                  });
                },
              ),
              _buildSwitchListTile(
                title: "Vegetarian",
                des: "Only include vegetarian meals.",
                currentValue: _isvegetarian,
                updateValue: (val) {
                  setState(() {
                    _isvegetarian = val;
                  });
                },
              ),
              _buildSwitchListTile(
                title: "Vegan",
                des: "Only include vegan meals.",
                currentValue: _isvegan,
                updateValue: (val) {
                  setState(() {
                    _isvegan = val;
                  });
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
