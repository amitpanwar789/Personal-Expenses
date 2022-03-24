// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './tansaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final List<Transaction> tansactions = [
    Transaction(id: '4544', date: DateTime.now(), price: 46646, title: "Laptop"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expense'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              width: 1000,
              height: 150,
              child: Card(
                child: Text(
                  "chart", style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                  //style: TextStyle(fontSize: 43)
                ),
                color: Color.fromARGB(255, 196, 235, 197),
              ),
            ),
            Column(
              children: tansactions.map((TX) {
                return Card(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text("Rs ${TX.price}" ,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color.fromARGB(255, 26, 187, 53))),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
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
                          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 109, 108, 108)),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
