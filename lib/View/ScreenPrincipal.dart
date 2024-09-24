import 'package:flutter/material.dart';

import 'NovoAgendamento.dart';
import 'ScreenAgendamento.dart';


class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _selectedIndex = 0;

  // Lista de telas para o BottomNavigationBar
  final List<Widget> _pages = [
    AgendamentosScreen(),
    Center(child: Text('Nova funcionalidade em breve!')), // Pode ser usado para outra função futuramente
  ];

  // Atualiza o índice da aba selecionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento de Mensagens'),
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          // Navega para a tela de novo agendamento
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NovoAgendamentoScreen()),
          );
        },
        child: Icon(Icons.add),
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
