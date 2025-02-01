import 'package:flutter/material.dart';
import 'package:money_tracker/screens/stats/widgets/chart.dart';

class ChartView extends StatelessWidget {
  const ChartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20.0,
        top: 20.0,
        bottom: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: const MyChart(),
    );
  }
}