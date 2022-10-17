import 'dart:async';

import 'package:web_socket_channel/io.dart';

var webSocketStream = IOWebSocketChannel.connect(
    Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=1089'));

StreamController broadCastController = StreamController.broadcast();

void initStream() {
  webSocketStream.stream.listen((event) {
    broadCastController.add(event);
  });
}
