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
          color: Colors.red,
          child: const SafeArea(
            child: TabBar(
              tabs: [
                Tab(text: 'Trade'),
                Tab(text: 'Transactions'),
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
