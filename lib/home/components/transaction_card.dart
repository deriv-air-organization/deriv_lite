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
                    ? Color.fromARGB(255, 99, 186, 102)
                    : Color.fromARGB(255, 226, 90, 81),
              ),
              //Row(
              //  children: [
              //    const Text('P/L:   ', style: TextStyle(color: Colors.grey)),
              //    Text(transactionData['amount'].toString()),
              //  ],
              //),
              Row(
                children: [
                  const Text('Buy Price:   ',
                      style: TextStyle(color: Colors.grey)),
                  Text(transactionData['payout'].toString()),
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
                  const Text('Contract Id:   ',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  Text(transactionData['contract_id'].toString()),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              const Text('Transaction Id:   ',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold)),
              Text(transactionData['transaction_id'].toString()),
            ],
          ),
        ],
      ),
    );
  }
}
