import 'package:browser_tab_management_app/features/chart/widgets/bar_chart_graph.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../features/chart/widgets/line_chart_graph.dart';
import '../features/chart/widgets/pie_chart_graph.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ColoredBox(
          color: Theme.of(context).secondaryHeaderColor,
          child: Container(
              padding: const EdgeInsets.all(60),
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 600, child: LineChartGraph()),
                  SizedBox(width: 400, height: 300, child: BarChartGraph()),
                  SizedBox(width: 300, child: PieChartGraph())
                ],
              ))),
    );
  }
}
