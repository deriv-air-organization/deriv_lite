import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:deriv_lite/common/models/tick_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:web_socket_channel/io.dart';

import '../../common/repository/api_for_price.dart';

class PriceComponent extends StatefulWidget {
  final String symbol;
  final TextStyle? style;
  PriceComponent({
    required this.symbol,
    this.style,
  });

  @override
  State<PriceComponent> createState() => _PriceComponentState();
}

class _PriceComponentState extends State<PriceComponent> {
  String price = '';

//1. connect web Socket

//2. send request = tick
//3. Listen to req adn update price

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    broadCastController.stream.listen((message) {
      final decodedString = jsonDecode(message);
      if (decodedString['tick'] == null) {
        return;
      }

      // print(decodedString);
      final tick = Tick.fromJson(decodedString['tick']);

      if (tick.symbol == widget.symbol) {
        setState(() {
          price = tick.quote.toString();
        });
      }
    });
    webSocketStream.sink
        .add(jsonEncode({"ticks": widget.symbol, "subscribe": 1}));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: widget.style,
    );
  }
}
