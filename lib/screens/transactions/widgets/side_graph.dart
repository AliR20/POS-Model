import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SideGraph extends StatelessWidget {
  SideGraph({Key? key}) : super(key: key);
   final  data = [
      _ChartData('Income', 12),
      _ChartData('Expenses', 15),
      _ChartData('Sale', 30),
      _ChartData('Purchases', 6.4),
    ];
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1.23,
        width: MediaQuery.of(context).size.width * 0.4,
        child: SfCartesianChart(
           primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_ChartData, String>>[
              BarSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Income',
                  color: Theme.of(context).colorScheme.primary)
            ]
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
 
  final String x;
  final double y;
}
