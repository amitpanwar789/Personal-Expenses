// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/tansaction.dart';
import 'package:intl/intl.dart';
import './charBar.dart';

class Chart extends StatelessWidget {
  //const Chart({Key? key}) : super(key: key);
  List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double dayAmount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          dayAmount += recentTransaction[i].price;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': dayAmount
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      (totalSpending != 0.0)
                          ? data['amount'] / totalSpending
                          : 0));
            }).toList(),
          ),
        ));
  }
}
