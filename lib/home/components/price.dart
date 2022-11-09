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
  Tick? lastTick;
  Tick? currentTick;

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
            lastTick = currentTick;
            currentTick = tick;
          });
        }
      }
    });
    webSocketStream.sink
        .add(jsonEncode({"ticks": widget.symbol, "subscribe": 1}));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getIcon(),
        Text(
          currentTick?.quote.toString() ?? '--',
          style: TextStyle(color: getColor(), fontSize: 14),
        ),
      ],
    );
  }

  Color getColor() {
    if (lastTick?.quote == currentTick?.quote) return Colors.grey;
    return (lastTick?.quote ?? 0) > (currentTick?.quote ?? 0)
        ? Colors.red
        : Colors.green;
  }

  Icon getIcon() {
    if (lastTick?.quote == currentTick?.quote) {
      return const Icon(Icons.arrow_drop_down);
    }
    return (lastTick?.quote ?? 0) > (currentTick?.quote ?? 0)
        ? const Icon(
            Icons.arrow_drop_down,
            color: Colors.red,
          )
        : const Icon(
            Icons.arrow_drop_up,
            color: Colors.green,
          );
  }
}
