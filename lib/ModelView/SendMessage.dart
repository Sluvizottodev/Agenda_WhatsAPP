import '../Model/Message.dart';
import '../Model/UltraMsgService.dart';

class MessageViewModel {
  final UltraMsgService _service;

  MessageViewModel({required UltraMsgService service}) : _service = service;

  Future<String> sendMessage(String token, String to, String body) async {
    MessageModel message = MessageModel(token: token, to: to, body: body);
    try {
      String response = await _service.sendMessage(message);
      return response;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
