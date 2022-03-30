// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/tansaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> user_transactions;
  TransactionList(this.user_transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 555,
      child: user_transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                ),
                Center(
                    //heightFactor:10 ,
                    child: Text("No transaction \n      added !! ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 169, 69, 187),
                            fontWeight: FontWeight.bold,
                            fontSize: 30)))
              ],
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                    elevation:
                        5, //color: Theme.of(context).colorScheme.secondary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 13),
                          child: Text(
                            "Rs ${user_transactions[index].price.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 22,
                          //     color: Colors.white)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade700),
                              color: Color.fromARGB(255, 99, 144, 167)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user_transactions[index].title,
                              style: TextStyle(
                                  color: Colors.blueGrey.shade600,
                                  fontSize: 22,
                                  fontFamily: 'Kurale',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat('EEE MMM d yyyy')
                                  .add_jm()
                                  .format(user_transactions[index].date),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 109, 108, 108)),
                            ),
                          ],
                        )
                      ],
                    ));
              }),
              itemCount: user_transactions.length),
    );
  }
}
