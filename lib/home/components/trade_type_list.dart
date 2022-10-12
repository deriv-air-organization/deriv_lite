import 'package:deriv_lite/home/components/trade_type_row.dart';
import 'package:flutter/material.dart';
import 'package:deriv_lite/common/models/symbol_model.dart';

class TradeTypeList extends StatelessWidget {
  List<Symbol> symbols;

  TradeTypeList({required this.symbols, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: symbols
          .map((e) => TradeTypeRow(
                price: e.pip,
                title: e.displayName,
              ))
          .toList(),
    );
  }
}
