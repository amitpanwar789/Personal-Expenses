// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);
  final Function AddNewTrans;
  NewTransaction(this.AddNewTrans);
  String title = "";
  double amount = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Title",
            ),
            onChanged: (val) => title = val,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            onChanged: (val) {amount =double.parse(val);},
          ),
          FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                "Add Transaction",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green),
              ),
              onPressed: () { AddNewTrans(title,amount);})
        ]),
      ),
    );
  }
}
