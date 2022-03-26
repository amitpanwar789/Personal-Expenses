// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tansaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> user_tansactions;
  TransactionList(this.user_tansactions);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: user_tansactions.map((TX) {
        return Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text("Rs ${TX.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 26, 187, 53))),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TX.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat('EEE MMM d yyyy').add_jm().format(TX.date),
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 109, 108, 108)),
                ),
              ],
            )
          ],
        ));
      }).toList(),
    );
  }
}
