import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final transactionData;

  TransactionCard({Key? key, required this.transactionData}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transactionData['longcode'].toString()),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: Text(transactionData['action_type'].toUpperCase()),
                backgroundColor: transactionData['action_type'] == 'buy'
                    ? Colors.green
                    : Colors.red,
              ),
              Row(
                children: [
                  const Text('P/L:   ', style: TextStyle(color: Colors.grey)),
                  Text(transactionData['amount'].toString()),
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
                  const Text('Balance:   ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(transactionData['balance_after'].toString()),
                ],
              ),
              Row(
                children: [
                  const Text('Transaction id:   ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(transactionData['transaction_id'].toString()),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
