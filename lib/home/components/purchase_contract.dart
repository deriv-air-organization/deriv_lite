import 'package:deriv_lite/home/components/price.dart';
import 'package:deriv_lite/home/home_page.dart';
import 'package:flutter/material.dart';

class PurchaseContract extends StatelessWidget {
  final String selectedsymbol;
  final String displayName;
  PurchaseContract({
    required this.selectedsymbol,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //appBar: AppBar(
        //  automaticallyImplyLeading: false,
        //  leading: IconButton(
        //    onPressed: () {
        //      Navigator.of(context).pop();
        //    },
        //    icon: const Icon(Icons.arrow_back_ios),
        //  ),
        //  actions: [
        //    IconButton(
        //      onPressed: () {
        //        Navigator.of(context).push(
        //            MaterialPageRoute(builder: ((context) => DerivHome())));
        //      },
        //      icon: const Icon(Icons.money_off_csred_rounded),
        //    )
        //  ],
        //),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text(
                      displayName,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 209, 201, 201)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 6),
                    child: PriceComponent(
                      symbol: selectedsymbol,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 241, 246, 242),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 6, top: 8),
                    child: Text(
                      "+0.66%",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Image.asset(
              'assets/images/chart_area.png',
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            const Text(
              'Amount',
              style: TextStyle(color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            const SizedBox(
              width: 50,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text('BUY'),
                  color: Colors.green,
                  textColor: Colors.white,
                  minWidth: 150,
                  height: 56,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text('SELL'),
                  color: Colors.red,
                  textColor: Colors.white,
                  minWidth: 150,
                  height: 56,
                ),
              ],
            )
          ],
        )));
  }
}

// 1. Authorize with token when websocket is open
// 2. Create 2 proposals when bottom sheet is open for buy and sell
// 3. Execute the correct proposal with buy request when tapped on the button
