import 'dart:convert';
import 'package:deriv_lite/common/models/tick_modal.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    broadCastController.stream.listen((message) {
      final decodedString = jsonDecode(message);
      if (decodedString['tick'] == null) {
        return;
      }

      final tick = Tick.fromJson(decodedString['tick']);

      if (tick.symbol == widget.symbol) {
        if (mounted) {
          setState(() {
            price = tick.quote.toString();
          });
        }
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
