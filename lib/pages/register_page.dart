import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Theme.of(context).unselectedWidgetColor,
        child: const Center(
          child: Text("Register"),
        ),
      ),
    );
  }
}
