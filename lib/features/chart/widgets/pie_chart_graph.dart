import 'package:browser_tab_management_app/features/chart/widgets/pie_chart_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartGraph extends StatefulWidget {
  const PieChartGraph({super.key});

  @override
  PieChartGraphState createState() => PieChartGraphState();
}

class PieChartGraphState extends State<PieChartGraph> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
              child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: pieChartGraphSections(touchedIndex))),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PieChartIndicator(color: Colors.blue, title: "First"),
              const SizedBox(height: 4),
              PieChartIndicator(color: Colors.red, title: "Second"),
              const SizedBox(height: 4),
              PieChartIndicator(color: Colors.yellow, title: "Third"),
              const SizedBox(height: 4),
              PieChartIndicator(color: Colors.purple, title: "Four"),
              const SizedBox(height: 18),
            ],
          )
        ],
      ),
    );
  }
}

List<PieChartSectionData> pieChartGraphSections(int touchedIndex) {
  return List.generate(4, (i) {
    final isTouched = i == touchedIndex;
    final fontSize = isTouched ? 25.0 : 16.0;
    final radius = isTouched ? 60.0 : 50.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    switch (i) {
      case 0:
        return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                shadows: shadows));
      case 1:
        return PieChartSectionData(
            color: Colors.red,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                shadows: shadows));
      case 2:
        return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                shadows: shadows));
      case 3:
        return PieChartSectionData(
            color: Colors.yellow,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
                shadows: shadows));
      default:
        throw Error();
    }
  });
}
