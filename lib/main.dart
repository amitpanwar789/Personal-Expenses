// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/new_transaction.dart';
import './widgets/transactionList.dart';
import './models/tansaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: Colors.orange.shade700),
      ),
      title: 'Personal Expense',
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> user_transactions = [
    Transaction(
        id: '4544', date: DateTime.now(), price: 46646, title: "Laptop"),
  ];
  void AddNewTrans(String txtitle, double txtAmount) {
    final NewTrans = Transaction(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        price: txtAmount,
        title: txtitle);
    setState(() {
      user_transactions.add(NewTrans);
    });
  }

  void strtNewTrans(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(AddNewTrans);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 84, 126, 145),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).copyWith(splashColor: Colors.blue),
        title: Text('Personal Expense'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(user_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        elevation: 7,
        child: Icon(Icons.create),
        onPressed: () => strtNewTrans(context),
      ),
    );
  }
}
