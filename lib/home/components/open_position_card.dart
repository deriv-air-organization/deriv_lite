import 'dart:convert';
import 'package:flutter/material.dart';
import '../../common/repository/api_for_price.dart';

class OpenPostionCard extends StatefulWidget {
  final int contractId;
  const OpenPostionCard({Key? key, required this.contractId}) : super(key: key);

  @override
  State<OpenPostionCard> createState() => _OpenPostionCardState();
}

class _OpenPostionCardState extends State<OpenPostionCard> {
  var openTransactionData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    broadCastController.stream.listen((message) {
      final decodedString = jsonDecode(message);

      if (decodedString['msg_type'] != 'proposal_open_contract') {
        return;
      }

      final contract = decodedString['proposal_open_contract'];

      if (contract == null || contract['contract_id'] != widget.contractId) {
        return;
      }

      if (mounted) {
        setState(() {
          openTransactionData = decodedString['proposal_open_contract'];
        });
      }
    });
    webSocketStream.sink.add(jsonEncode({
      "proposal_open_contract": 1,
      'contract_id': widget.contractId,
      "subscribe": 1
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (openTransactionData == null ||
        openTransactionData['status'] != 'open') {
      return Container();
    }
    double indicativePrice =
        (openTransactionData['profit']?.toDouble() ?? 0.0) +
            (openTransactionData['buy_price']?.toDouble() ?? 0.0);
    int expiryTime = openTransactionData['expiry_time'];
    DateTime expiry = DateTime.fromMillisecondsSinceEpoch(expiryTime * 1000);

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(openTransactionData['display_name']),
              Row(
                children: [
                  const Text('contract Id:',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(openTransactionData['contract_id'].toString()),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(openTransactionData['contract_type'].toUpperCase()),
                backgroundColor: openTransactionData['contract_type'] == 'CALL'
                    ? Colors.green
                    : Colors.red,
              ),
              Row(
                children: [
                  const Text('Indicative price:   ',
                      style: TextStyle(color: Colors.grey)),
                  Text(indicativePrice.toStringAsFixed(3)),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  const Text('Buy Price:   ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(openTransactionData['payout'].toString()),
                ],
              ),
              Row(
                children: [
                  const Text('P/L:   ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(openTransactionData['profit'].toString()),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Text('Time remaining:   ',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
              Text(expiry.toIso8601String()),
            ],
          ),
        ],
      ),
    );
  }
}
