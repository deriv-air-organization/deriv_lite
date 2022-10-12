import 'package:flutter/material.dart';

class TradeTypeRow extends StatelessWidget {
  final String title;
  final double price;

  const TradeTypeRow({
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 50),
        ),
        Expanded(
          child: Text(title, textAlign: TextAlign.start),
        ),
        Expanded(
          child: Text(price.toString(), textAlign: TextAlign.start),
        ),
        //button
        MaterialButton(
          onPressed: () {},
          child: const Text('BUY'),
          color: Colors.green,
          textColor: Colors.white,
          minWidth: 10,
          height: 26,
        ),
        MaterialButton(
          onPressed: () {},
          child: const Text('SELL'),
          color: Colors.red,
          textColor: Colors.white,
          minWidth: 10,
          height: 26,
        ),
      ],
    );
  }
}
