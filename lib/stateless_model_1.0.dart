import 'package:flutter/material.dart';

// Página modelo do tipo Stateless
// Use como modelo para criar novas páginas Stateless no aplicativo

class StatelessModelPage extends StatelessWidget {
  const StatelessModelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateless',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esta é uma Página Stateless!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue,
        child: SizedBox(
          height: 50.0,
          child: Center(
            child: Text(
              'Rodapé da Página Stateless',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
