import 'package:flutter/material.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class ChartData {
        ChartData(this.x, this.y, this.color);
            final String x;
            final double y;
            final Color color;
    }

class _PieChartState extends State<PieChart> {
  final List<ChartData> chartData = [
            ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
            ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
            ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
            ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
        ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("图"),
      ),
      body:  Center(
                // child: Container(
                //     child: SfCircularChart(
                //         series: <CircularSeries>[
                //             // Renders doughnut chart
                //             DoughnutSeries<ChartData, String>(
                //                 dataSource: chartData,
                //                 pointColorMapper:(ChartData data,  _) => data.color,
                //                 xValueMapper: (ChartData data, _) => data.x,
                //                 yValueMapper: (ChartData data, _) => data.y
                //             )
                //         ]
                //     )
                // )
            )
    );
  }
}