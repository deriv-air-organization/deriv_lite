import 'package:deriv_lite/home/components/trade_type_list.dart';
import 'package:flutter/material.dart';
import '../common/models/market_model.dart';
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
    final markets = Set<Market>.from(symbols.map((e) => e.market)).toList();

    return DefaultTabController(
      length: markets.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 32,
            child: TabBar(
              indicator: BoxDecoration(
                  color: Color.fromARGB(255, 100, 99, 99),
                  borderRadius: BorderRadius.circular(8)),
              //shape: BoxShape.rectangle),
              // labelPadding: EdgeInsets.only(left: 25, right: 25),
              isScrollable: true,
              tabs: markets
                  .map((e) => Tab(
                          child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(e.displayName),
                      )))
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: markets
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
