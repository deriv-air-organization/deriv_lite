import 'package:deriv_lite/home/components/trade_type_list.dart';
import 'package:flutter/material.dart';
import '../common/models/symbol_model.dart';
import '../common/repository/symbols_repo.dart';

class DerivHome extends StatefulWidget {
  const DerivHome({Key? key}) : super(key: key);

  @override
  State<DerivHome> createState() => _DerivHomeState();
}

class _DerivHomeState extends State<DerivHome> {
  final SymbolsRepoBase symbolsRepo = SymbolsRepo();
  List<Symbol> symbols = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final list = await symbolsRepo.getSymbols();
    if (mounted) {
      setState(() {
        symbols = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Market.values.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: TabBar(
            isScrollable: true,
            tabs: Market.values
                .map((e) => Tab(child: Text(e.displayName)))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: Market.values
              .map((e) => TradeTypeList(
                    symbols: symbols
                        .where((element) => element.market == e)
                        .toList(),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
