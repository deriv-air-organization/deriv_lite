import 'package:deriv_lite/home/components/purchase_contract.dart';
import 'package:deriv_lite/home/components/trade_type_row.dart';
import 'package:flutter/material.dart';
import 'package:deriv_lite/common/models/symbol_model.dart';

class TradeTypeList extends StatelessWidget {
  final List<Symbol> symbols;
  const TradeTypeList({
    Key? key,
    required this.symbols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: symbols
          .map((e) => TradeTypeRow(
                symbol: e.symbol,
                title: e.displayName,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => PurchaseContract(
                      displayName: e.displayName,
                      selectedsymbol: e.symbol,
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}
