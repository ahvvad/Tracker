import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/stats/widgets/custom_stats_app_bar.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 25.0, left: 25.0, top: 20.0),
        child: Column(
          children: [
            CustomStatsAppBar(),
          SizedBox(height:20 )
          ],
        ),
      ),
    );
  }
}
