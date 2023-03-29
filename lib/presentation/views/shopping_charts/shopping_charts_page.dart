import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:task_shopping/data/models/shopping_item.dart';
import 'package:task_shopping/presentation/view_models/shopping_view_model.dart';

@RoutePage()
class ShoppingChartsPage extends StatefulWidget {
  final ShoppingViewModel shoppingViewModel;

  const ShoppingChartsPage({Key? key, required this.shoppingViewModel})
      : super(key: key);

  @override
  State<ShoppingChartsPage> createState() => _ShoppingChartsPageState();
}

class _ShoppingChartsPageState extends State<ShoppingChartsPage> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chart',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
              aspectRatio: 1.0,
              child: PieChart(PieChartData(
                sections: _chartSections(
                    widget.shoppingViewModel.currentShoppingItems),
                centerSpaceRadius: 48.0,
              ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                  ),
                  borderData: FlBorderData(
                    show: true,
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      dotData: FlDotData(show: true),
                      spots: widget.shoppingViewModel.currentShoppingItems
                          .map((point) => FlSpot(
                                point.quantity.toDouble(),
                                point.price,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> _chartSections(List<ShoppingItem> shoppingItems) {
    final List<PieChartSectionData> list = [];
    for (var sector in shoppingItems) {
      const double radius = 40.0;
      final data = PieChartSectionData(
        color: Color(int.parse('0xff${_getRandomColor()}')),
        value: sector.price,
        title: '${(sector.price).toStringAsFixed(0)}\$',
        radius: radius,
      );
      list.add(data);
    }
    return list;
  }

  String _getRandomColor() {
    final random = Random();
    final hex = (random.nextDouble() * 0xFFFFFF).toInt().toRadixString(16);
    return hex.padLeft(6, '0');
  }
}
