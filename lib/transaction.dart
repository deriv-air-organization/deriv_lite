import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 50),
                ),
                Expanded(
                  child: Text(
                    'Trade Type',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Contract Type',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),

                Expanded(
                  child: Text(
                    'P/L',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                //button
              ],
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 50),
                ),
                const Expanded(
                  child: Text(
                    'Volatility 10 Index',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('BUY'),
                    color: Colors.green,
                    textColor: Colors.white,
                    minWidth: 10,
                    height: 26,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 36),
                ),
                const Expanded(
                  child: Text(
                    '+100.50',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                //button
              ],
            ),
            Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 50),
                ),
                const Expanded(
                  child: Text(
                    'Volatility 10 Index',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('SELL'),
                    color: Colors.red,
                    textColor: Colors.white,
                    minWidth: 10,
                    height: 26,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 36),
                ),
                const Expanded(
                  child: Text(
                    '-30.70',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                //button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
