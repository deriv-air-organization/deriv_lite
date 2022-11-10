import 'package:deriv_lite/home/components/price.dart';
import 'package:flutter/material.dart';

class TradeTypeRow extends StatelessWidget {
  final String title;
  final String symbol;
  final VoidCallback onPressed;

  const TradeTypeRow({
    Key? key,
    required this.symbol,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 40),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Expanded(
            child: PriceComponent(symbol: symbol),
          ),
          const Icon(Icons.chevron_right_outlined)
        ],
      ),
    );
  }
}
