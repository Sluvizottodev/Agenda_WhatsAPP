import 'package:flutter/material.dart';
import '../Model/Agendamento.dart';
import '../ModelView/LogAgendamento.dart';


class AgendamentosScreen extends StatelessWidget {
  final AgendamentoViewModel _viewModel = AgendamentoViewModel();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AgendamentoModel>>(
      stream: _viewModel.obterAgendamentos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Nenhum agendamento encontrado'));
        }

        final agendamentos = snapshot.data!;

        return ListView.builder(
          itemCount: agendamentos.length,
          itemBuilder: (context, index) {
            final agendamento = agendamentos[index];
            return ListTile(
              title: Text(agendamento.mensagem),
              subtitle: Text('Enviado para: ${agendamento.grupo}\nData: ${agendamento.dataEnvio}'),
              trailing: IconButton(
                icon: Icon(Icons.cancel, color: Colors.red),
                onPressed: () {
                  _viewModel.cancelarAgendamento(agendamento.id);
                },
              ),
            );
          },
        );
      },
    );
  }
}
