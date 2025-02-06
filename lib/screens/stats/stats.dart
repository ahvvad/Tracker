import 'package:flutter/material.dart';
import 'package:money_tracker/screens/home/views/widgets/transactions_item.dart';
import 'package:money_tracker/screens/stats/widgets/income_expenses_switch.dart';
import 'package:money_tracker/screens/stats/widgets/chart_details.dart';
import 'package:money_tracker/screens/stats/widgets/chart_view.dart';
import 'package:money_tracker/screens/stats/widgets/custom_stats_app_bar.dart';
import 'package:money_tracker/screens/stats/widgets/stats_bar.dart';

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
            SizedBox(height: 20.0),
            IncomeExpensesSwitch(),
            SizedBox(height: 20.0),
            ChartDetails(),
            ChartView(),
            SizedBox(height: 20.0),
            StatsBar(),
            SizedBox(height: 20.0),
            TransactionsItem(),
          ],
        ),
      ),
    );
  }
}

