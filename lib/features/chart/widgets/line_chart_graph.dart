import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(LineChartData(
          lineBarsData: [
            LineChartBarData(spots: const [
              FlSpot(1, 323),
              FlSpot(2, 538),
              FlSpot(3, 368),
              FlSpot(4, 259),
              FlSpot(5, 551),
              FlSpot(6, 226),
              FlSpot(7, 268),
              FlSpot(8, 296),
              FlSpot(9, 203),
              FlSpot(10, 246),
              FlSpot(11, 345),
            ])
          ],
          titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, interval: 1)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
          maxY: 1000,
          minY: 0)),
    );
  }
}
