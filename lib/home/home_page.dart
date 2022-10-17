import 'package:deriv_lite/home/components/trade_type_list.dart';
import 'package:deriv_lite/home/components/trade_type_row.dart';
import 'package:deriv_lite/transaction.dart';
import 'package:flutter/foundation.dart';
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

    setState(() {
      symbols = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> markets =
        Market.values.map((e) => describeEnum(e)).toList();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.person),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => Transaction())));
              },
              icon: const Icon(Icons.money_off_csred_rounded),
            )
          ],
        ),
        body: DefaultTabController(
            length: Market.values.length,
            initialIndex: 0,
            child: Scaffold(
                body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    toolbarHeight: 20,
                    backgroundColor: Colors.black,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: Market.values
                          .map((e) => Tab(child: Text(e.displayName)))
                          .toList(),
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: Market.values
                    .map((e) => TradeTypeList(
                          symbols: symbols
                              .where((element) => element.market == e)
                              .toList(),
                        ))
                    .toList(),
              ),
            ))));
  }
}
