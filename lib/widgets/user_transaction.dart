// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import './transactionList.dart';
import './new_transaction.dart';
import '../models/tansaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(AddNewTrans), TransactionList(user_transactions)],
    );
  }
}
