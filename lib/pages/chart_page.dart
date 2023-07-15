import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).secondaryHeaderColor,
        child: const Center(
          child: Text("Chart"),
        ),
      ),
    );
  }
}
