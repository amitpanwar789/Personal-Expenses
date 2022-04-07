// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:personal_expense/widgets/chart.dart';
import 'package:personal_expense/widgets/new_transaction.dart';
import './widgets/transactionList.dart';
import './models/tansaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.orange.shade700),
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
              titleMedium: TextStyle(
                  fontFamily: 'Kurale',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 241, 233, 233))),
          appBarTheme: AppBarTheme(
              toolbarTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      titleMedium: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 50,
                          fontWeight: FontWeight.bold))
                  .headline6),
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
          )),
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
  void AddNewTrans(String txtitle, double txtAmount , DateTime pickedDateTime) {
    final NewTrans = Transaction(
        id: DateTime.now().toString(),
        date: pickedDateTime,
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

  List<Transaction> get _recentTransaction {
    return user_transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
  void deleteItem(String id){
    setState(() {
      user_transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 81, 122, 141),
      appBar: AppBar(
          //backgroundColor: Theme.of(context).copyWith(splashColor: Colors.blue),
          title: Text(
        'Personal Expense',
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Chart(_recentTransaction),
            TransactionList(user_transactions , deleteItem),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        elevation: 7,
        child: Icon(Icons.create),
        onPressed: () => strtNewTrans(context),
      ),
    );
  }
}
