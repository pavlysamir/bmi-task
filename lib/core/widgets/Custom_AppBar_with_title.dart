import 'package:bmi_task/constants.dart';
import 'package:flutter/material.dart';

class CustomAppbareWithTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbareWithTitle({required this.title, super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
