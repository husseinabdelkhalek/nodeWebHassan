import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  print("hello world");

  IO.Socket socket = IO.io('http://localhost:3000', {
    "transports": ["websocket"],
    "autoConnect": false
  });
  socket.connect();
  socket.onConnect((data) {
    print("connected");

    socket.emit("message", "hello");
    socket.on("message", (data) {
      print(data["id"]);
    });
  });
  socket.onDisconnect((data) {
    print("disconnected");
  });
}
