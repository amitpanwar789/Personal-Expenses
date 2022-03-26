// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key? key}) : super(key: key);
  void submited() {
    if (titleController.text.isEmpty || double.parse(amountController.text) < 0)
      return;
    AddNewTrans(titleController.text,
        double.parse(amountController.text));
  }

  final Function AddNewTrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  String title = "";
  double amount = 0;
  NewTransaction(this.AddNewTrans);
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
            //onChanged: (val)=>title = val,
            controller: titleController,
            onSubmitted: (_) {
              submited();
            },
          ),
          TextField(
              decoration: InputDecoration(labelText: "Amount"),
              //onChanged: (am)=>amount = double.parse(am),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submited();
              }),
          FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                "Add Transaction",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green),
              ),
              onPressed: submited)
        ]),
      ),
    );
  }
}
