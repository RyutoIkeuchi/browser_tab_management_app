import 'package:flutter/material.dart';

class AbilityTypeCard extends StatelessWidget {
  AbilityTypeCard({Key? key, required this.ability}) : super(key: key);

  final Map<String, dynamic> ability;

  final icons = Icons.airplane_ticket;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(10, 10),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 70,
                  height: 50,
                ),
                Positioned(
                  top: -15,
                  left: 20,
                  child: Container(
                    width: 70,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 5),
                          blurRadius: 2.0,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(ability["icon"]),
                  ),
                ),
              ],
            ),
            Text(ability["name"]),
          ]),
    );
  }
}