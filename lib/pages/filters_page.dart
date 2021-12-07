import 'package:flutter/material.dart';

class FiltersPage extends StatelessWidget {
  static const routeName = "/filters";
  const FiltersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Filters"),
      ),
    );
  }
}
