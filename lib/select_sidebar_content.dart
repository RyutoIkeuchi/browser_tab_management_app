import 'package:flutter/material.dart';

class SelectSidebarContent extends StatelessWidget {
  const SelectSidebarContent({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
        color: Colors.blue[200]!,
        child: Center(
          child: Text(selectedIndex.toString()),
        ),
      ),
    );
  }
}
