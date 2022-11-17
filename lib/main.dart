import 'package:deriv_lite/login_page.dart';
import 'package:deriv_lite/home/components/transaction.dart';
import 'package:deriv_lite/tabs_page.dart';
import 'package:deriv_lite/theme.dart';
import 'package:flutter/material.dart';

import 'common/repository/api_for_price.dart';

void main() {
  initStream();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deriv Air',
      theme: CustomTheme.light,
      home: const LoginPage(),
    );
  }
}
