import 'package:flutter/material.dart';
import 'package:money_tracker/screens/stats/widgets/chart.dart';
import 'package:money_tracker/screens/stats/widgets/custom_stats_app_bar.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 20.0),
        child: Column(
          children: [
            const CustomStatsAppBar(),
            const SizedBox(height: 20),
            Container(
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
            )
          ],
        ),
      ),
    );
  }
}
