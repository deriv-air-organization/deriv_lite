import 'package:deriv_lite/home/components/transaction.dart';
import 'package:deriv_lite/home/home_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 48, 48, 48),
          child: SafeArea(
            child: TabBar(
              tabs: [
                Tab(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.show_chart),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text("Trade"),
                  ],
                )),
                Tab(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.assured_workload),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text("Transactions"),
                  ],
                )),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            DerivHome(),
            Transaction(),
          ],
        ),
      ),
    );
  }
}
