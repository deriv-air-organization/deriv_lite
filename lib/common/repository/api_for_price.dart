import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

var webSocketStream = IOWebSocketChannel.connect(
    Uri.parse('wss://qa10.deriv.dev/websockets/v3?l=EN&app_id=16929'));

StreamController broadCastController = StreamController.broadcast();

void initStream() {
  webSocketStream.stream.listen((event) {
    // print("event: $event");
    broadCastController.add(event);
  });
  webSocketStream.sink.add(jsonEncode({"authorize": "xAMxx8SgwXwSdfo"}));
}

void sendRequest(Map<String, dynamic> data) {
  webSocketStream.sink.add(jsonEncode(data));
}
