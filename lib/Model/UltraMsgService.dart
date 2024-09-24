import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Message.dart';


class UltraMsgService {
  final String instanceId;
  final String baseUrl;

  UltraMsgService({required this.instanceId})
      : baseUrl = 'https://api.ultramsg.com/$instanceId/messages/chat';

  Future<String> sendMessage(MessageModel message) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    var request = http.Request('POST', Uri.parse(baseUrl));
    request.bodyFields = message.toMap();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      throw Exception('Failed to send message: ${response.reasonPhrase}');
    }
  }
}
