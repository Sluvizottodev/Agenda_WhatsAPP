class AgendamentoModel {
  String id;
  String mensagem;
  String grupo;
  DateTime dataEnvio;

  AgendamentoModel({required this.id, required this.mensagem, required this.grupo, required this.dataEnvio});

  // Converte o modelo para o formato que será salvo no Firebase
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mensagem': mensagem,
      'grupo': grupo,
      'dataEnvio': dataEnvio.toIso8601String(),
    };
  }

  // Converte um documento do Firebase para o modelo
  factory AgendamentoModel.fromMap(Map<String, dynamic> map) {
    return AgendamentoModel(
      id: map['id'],
      mensagem: map['mensagem'],
      grupo: map['grupo'],
      dataEnvio: DateTime.parse(map['dataEnvio']),
    );
  }
}
