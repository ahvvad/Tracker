import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/home/views/widgets/custom_app_bar.dart';
import 'package:money_tracker/screens/home/views/widgets/home_card.dart';
import 'package:money_tracker/screens/home/views/widgets/transactions_bar.dart';
import 'package:money_tracker/screens/home/views/widgets/transactions_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 25.0, left: 25.0, top: 20.0),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 20.0),
            HomeCard(),
            SizedBox(height: 40.0),
            TransactionsBar(),
            SizedBox(height: 20.0),
            TransactionsItem(),
          ],
        ),
      ),
    );
  }
}
