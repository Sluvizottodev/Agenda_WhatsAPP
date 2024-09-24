import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Model/Agendamento.dart';
import '../ModelView/LogAgendamento.dart';

class NovoAgendamentoScreen extends StatefulWidget {
  @override
  _NovoAgendamentoScreenState createState() => _NovoAgendamentoScreenState();
}

class _NovoAgendamentoScreenState extends State<NovoAgendamentoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mensagemController = TextEditingController();
  final _grupoController = TextEditingController();
  DateTime _dataEnvio = DateTime.now();

  final AgendamentoViewModel _viewModel = AgendamentoViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Agendamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _mensagemController,
                decoration: InputDecoration(labelText: 'Mensagem'),
                validator: (value) => value!.isEmpty ? 'Informe a mensagem' : null,
              ),
              TextFormField(
                controller: _grupoController,
                decoration: InputDecoration(labelText: 'Grupo de WhatsApp'),
                validator: (value) => value!.isEmpty ? 'Informe o grupo' : null,
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Data de envio: ${DateFormat.yMd().add_jm().format(_dataEnvio)}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      setState(() {
                        _dataEnvio = DateTime(date.year, date.month, date.day, time.hour, time.minute);
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final novoAgendamento = AgendamentoModel(
                      id: DateTime.now().toString(),
                      mensagem: _mensagemController.text,
                      grupo: _grupoController.text,
                      dataEnvio: _dataEnvio,
                    );
                    _viewModel.adicionarAgendamento(novoAgendamento);
                    Navigator.pop(context);
                  }
                },
                child: Text('Agendar Mensagem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
