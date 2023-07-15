import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).disabledColor,
        child: const Center(
          child: Text("Setting"),
        ),
      ),
    );
  }
}
