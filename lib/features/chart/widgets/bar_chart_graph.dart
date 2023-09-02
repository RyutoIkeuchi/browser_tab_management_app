import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        borderData: FlBorderData(
            border: const Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1))),
        groupsSpace: 10,
        barGroups: [
          BarChartGroupData(
              x: 1, barRods: [BarChartRodData(toY: 10, width: 15)]),
          BarChartGroupData(
              x: 2, barRods: [BarChartRodData(toY: 9, width: 15)]),
          BarChartGroupData(
              x: 3, barRods: [BarChartRodData(toY: 4, width: 15)]),
          BarChartGroupData(
              x: 4, barRods: [BarChartRodData(toY: 2, width: 15)]),
          BarChartGroupData(
              x: 5, barRods: [BarChartRodData(toY: 13, width: 15)]),
          BarChartGroupData(
              x: 6, barRods: [BarChartRodData(toY: 17, width: 15)]),
          BarChartGroupData(
              x: 7, barRods: [BarChartRodData(toY: 19, width: 15)]),
          BarChartGroupData(
              x: 8, barRods: [BarChartRodData(toY: 21, width: 15)]),
        ]));
  }
}
