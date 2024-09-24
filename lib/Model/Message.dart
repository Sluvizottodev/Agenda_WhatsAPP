class MessageModel {
  final String token;
  final String to;
  final String body;

  MessageModel({required this.token, required this.to, required this.body});

  Map<String, String> toMap() {
    return {
      'token': token,
      'to': to,
      'body': body,
    };
  }
}
