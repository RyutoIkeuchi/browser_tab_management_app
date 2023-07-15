import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).primaryColorLight,
        child: const Center(
          child: Text("Dashboard"),
        ),
      ),
    );
  }
}
