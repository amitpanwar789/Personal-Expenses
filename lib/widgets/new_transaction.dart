// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function AddNewTrans;

  NewTransaction(this.AddNewTrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  //const NewTransaction({Key? key}) : super(key: key);
  void submited() {
    if(amountController.text.isEmpty ) return;
    if (titleController.text.isEmpty || double.parse(amountController.text) < 0 || pickedDateTime == null)
      return;
    widget.AddNewTrans(
        titleController.text, double.parse(amountController.text),pickedDateTime);
    Navigator.of(context).pop();
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? pickedDateTime;
  String title = "";

  double amount = 0;

  void datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((date) {
      setState(() {
        pickedDateTime = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 37, horizontal: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            style: TextStyle(color: Color.fromARGB(255, 137, 136, 136)),
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
              style: TextStyle(color: Color.fromARGB(255, 137, 136, 136)),
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                submited();
              }),
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (pickedDateTime == null) ? 'No Date Choosen' : 'Picked Date: ${DateFormat.yMd().format(pickedDateTime!)}',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontFamily: 'OpenSans'),
                  ),
                  FlatButton(
                      onPressed: datePicker,
                      child: Text('Choose Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple)))
                ]),
          ),
          SizedBox(
            height: 50,
          ),
          RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                "Add Transaction",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              onPressed: submited)
        ]),
      ),
    );
  }
}
