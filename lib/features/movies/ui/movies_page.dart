import 'package:flutter/material.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Movies',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
