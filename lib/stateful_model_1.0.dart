import 'package:flutter/material.dart';

// Página modelo do tipo Stateful
// Use como modelo para criar novas páginas Stateful no aplicativo

class StatefulModelPage extends StatefulWidget {
  const StatefulModelPage({super.key});

  @override
  State<StatefulModelPage> createState() => _StatefulModelPageState();
}

class _StatefulModelPageState extends State<StatefulModelPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateful',
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
              'Esta é uma Página Stateful!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            Text(
              'Contador: $_counter',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _incrementCounter,
              // Chama o método para incrementar o contador.
              child: const Text('Incrementar Contador'),
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
              'Rodapé da Página Stateful',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
