import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //const ChartBar({ Key? key }) : super(key: key);
  String label;
  double spendAmount;
  double spendAmountPercent;
  ChartBar(this.label, this.spendAmount, this.spendAmountPercent);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('Rs ${spendAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: 15,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 220, 220, 1),
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
            FractionallySizedBox(
              heightFactor: spendAmountPercent,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(label)
      ],
    );
  }
}
