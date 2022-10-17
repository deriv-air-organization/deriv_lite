import 'package:deriv_lite/home/components/price.dart';
import 'package:flutter/material.dart';

class TradeTypeRow extends StatelessWidget {
  final String title;
  final String symbol;
  final VoidCallback onPressed;

  TradeTypeRow({
    required this.symbol,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 50),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: PriceComponent(
              symbol: symbol,
            ),
          ),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
