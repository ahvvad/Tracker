import 'package:flutter/material.dart';
import 'package:money_tracker/data/data.dart';

class TransactionsItem extends StatelessWidget {
  const TransactionsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: transactionsData.length,
        itemBuilder: (context, int i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: transactionsData[i]['color'],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Icon(
                              transactionsData[i]['icon'],
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Text(
                          transactionsData[i]['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF263A4D).withOpacity(0.9),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          transactionsData[i]['totalAmount'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF263A4D).withOpacity(0.9),
                          ),
                        ),
                        Text(
                          transactionsData[i]['date'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF263A4D).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
