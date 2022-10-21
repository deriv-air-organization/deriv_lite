import 'dart:convert';
import 'package:deriv_lite/home/components/open_position_card.dart';
import 'package:deriv_lite/home/components/transaction_card.dart';
import 'package:flutter/material.dart';
import '../../common/repository/api_for_price.dart';

class Transaction extends StatefulWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List transactions = [];
  Set openContractList = {};
  int contractId = 0;
  @override
  void initState() {
    super.initState();

    broadCastController.stream.listen((message) {
      final decodedString = jsonDecode(message);

      if (decodedString['msg_type'] == 'statement') {
        transactions = decodedString['statement']['transactions'].where((e) {
          return e['action_type'] == 'buy' || e['action_type'] == 'sell';
        }).toList();
      }

      if (decodedString['msg_type'] == 'transaction') {
        final transaction = decodedString['transaction'];
        final action = transaction['action'];

        if (action != null) {
          final contractId = decodedString['transaction']['contract_id'];

          if (!openContractList.contains(contractId)) {
            openContractList.add(decodedString['transaction']['contract_id']);
          }
        }
      }

      if (decodedString['msg_type'] == 'portfolio') {
        final List contracts = decodedString['portfolio']['contracts'];
        for (var element in contracts) {
          final id = element['contract_id'];
          if (id != null && !openContractList.contains(id)) {
            openContractList.add(id);
          }
        }
      }
      if (mounted) {
        setState(() {});
      }
    });
    webSocketStream.sink.add(jsonEncode({"statement": 1, 'description': 1}));
    webSocketStream.sink.add(jsonEncode({"transaction": 1, "subscribe": 1}));
    webSocketStream.sink.add(jsonEncode({"portfolio": 1}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                const SliverAppBar(
                  toolbarHeight: 20,
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Closed Position'),
                      Tab(text: 'Open Position')
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: transactions
                      .map((e) => TransactionCard(
                            transactionData: e,
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: openContractList
                      .map((e) => OpenPostionCard(
                            key: Key(e.toString()),
                            contractId: e,
                          ))
                      .toList(),
                ),
              ),
            ]),
          ),
        ));
  }
}
