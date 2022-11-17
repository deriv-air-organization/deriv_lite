import 'dart:convert';
import 'package:deriv_lite/home/components/price.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/repository/api_for_price.dart';

class PurchaseContract extends StatefulWidget {
  final String selectedsymbol;
  final String displayName;

  const PurchaseContract({
    Key? key,
    required this.selectedsymbol,
    required this.displayName,
  }) : super(key: key);

  @override
  State<PurchaseContract> createState() => _PurchaseContractState();
}

class _PurchaseContractState extends State<PurchaseContract> {
  String buyProposalId = '';
  String sellProposalId = '';
  double amount = 10.0;
  TextEditingController amountController = TextEditingController(text: "10");
  void createProposal(bool isBuy) {
    final proposal = {
      "proposal": 1,
      "amount": amount,
      "barrier": "+0.1",
      "basis": "payout",
      "contract_type": isBuy ? 'CALL' : 'PUT',
      "currency": "USD",
      "duration": 60,
      "duration_unit": "s",
      "symbol": widget.selectedsymbol
    };
    sendRequest(proposal);
  }

  @override
  void initState() {
    broadCastController.stream.listen((message) {
      final decodedString = jsonDecode(message);
      if (decodedString['msg_type'] != "proposal") {
        return;
      }

      setState(() {
        if (decodedString['echo_req']['contract_type'] == 'PUT') {
          sellProposalId = decodedString['proposal']['id'];
        }
        if (decodedString['echo_req']['contract_type'] == 'CALL') {
          buyProposalId = decodedString['proposal']['id'];
        }
      });
    });
    createProposal(true);
    createProposal(false);
    super.initState();
  }

  void resetProposals() {
    setState(() {
      buyProposalId = '';
      sellProposalId = '';
    });
    createProposal(true);
    createProposal(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                widget.displayName,
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 209, 201, 201)),
              ),
              const SizedBox(height: 8),
              PriceComponent(
                symbol: widget.selectedsymbol,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 241, 246, 242),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              TextField(
                controller: amountController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))
                ],
                onChanged: (String newvalue) {
                  final value = double.tryParse(newvalue);
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    amount = value;
                  });
                  resetProposals();
                },
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (buyProposalId.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        sendRequest({"buy": buyProposalId, "price": 100});
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      minWidth: 150,
                      height: 56,
                      child: const Text('BUY'),
                    ),
                  if (sellProposalId.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        sendRequest({"buy": sellProposalId, "price": 100});
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      minWidth: 150,
                      height: 56,
                      child: const Text('SELL'),
                    ),
                ],
              )
            ],
          ),
        ));
  }
}
