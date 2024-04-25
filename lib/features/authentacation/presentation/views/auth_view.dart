import 'package:bmi_task/core/widgets/Custom_AppBar_with_title.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcom',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: const Column(
        children: [
          Text('Auth View'),
        ],
      ),
    );
  }
}
