
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/Agendamento.dart';


class AgendamentoViewModel {
  final CollectionReference _agendamentoCollection = FirebaseFirestore.instance.collection('agendamentos');

  // Adicionar um novo agendamento no Firebase
  Future<void> adicionarAgendamento(AgendamentoModel agendamento) async {
    await _agendamentoCollection.add(agendamento.toMap());
  }

  // Obter lista de agendamentos do Firebase
  Stream<List<AgendamentoModel>> obterAgendamentos() {
    return _agendamentoCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => AgendamentoModel.fromMap(doc.data() as Map<String, dynamic>)).toList()
    );
  }

  // Cancelar (deletar) um agendamento
  Future<void> cancelarAgendamento(String id) async {
    await _agendamentoCollection.doc(id).delete();
  }
}
