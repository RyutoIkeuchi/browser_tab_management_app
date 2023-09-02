import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: Container(
              padding: const EdgeInsets.all(60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 600,
                      child: AspectRatio(
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
                                    sideTitles: SideTitles(
                                        showTitles: true, interval: 1)),
                                leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false))),
                            maxY: 1000,
                            minY: 0)),
                      )),
                  SizedBox(
                      width: 600,
                      child: BarChart(BarChartData(
                          borderData: FlBorderData(
                              border: const Border(
                                  top: BorderSide.none,
                                  right: BorderSide.none,
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1))),
                          groupsSpace: 10,
                          barGroups: [
                            BarChartGroupData(
                                x: 1,
                                barRods: [BarChartRodData(toY: 10, width: 15)]),
                            BarChartGroupData(
                                x: 2,
                                barRods: [BarChartRodData(toY: 9, width: 15)]),
                            BarChartGroupData(
                                x: 3,
                                barRods: [BarChartRodData(toY: 4, width: 15)]),
                            BarChartGroupData(
                                x: 4,
                                barRods: [BarChartRodData(toY: 2, width: 15)]),
                            BarChartGroupData(
                                x: 5,
                                barRods: [BarChartRodData(toY: 13, width: 15)]),
                            BarChartGroupData(
                                x: 6,
                                barRods: [BarChartRodData(toY: 17, width: 15)]),
                            BarChartGroupData(
                                x: 7,
                                barRods: [BarChartRodData(toY: 19, width: 15)]),
                            BarChartGroupData(
                                x: 8,
                                barRods: [BarChartRodData(toY: 21, width: 15)]),
                          ]))),
                  SizedBox(
                    width: 200,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(value: 40, title: '40%'),
                          PieChartSectionData(value: 30, title: '30%'),
                          PieChartSectionData(value: 10, title: '10%'),
                          PieChartSectionData(value: 20, title: '20%'),
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
