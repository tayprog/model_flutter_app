import 'package:flutter/material.dart';

// Importa as páginas do aplicaivo
import 'stateless_model_1.0.dart';
import 'stateful_model_1.0.dart';
import 'unimplemented_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Apps Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: '/',

      routes: {
        // Página inicial
        '/': (context) => const HomePage(), 

        // Página não implementada
        '/test': (context) => const TestPage(), 

        // Página stateless
        '/stateless_model': (context) => const StatelessModelPage(), 

        // Página stateful
        '/stateful_model': (context) => const StatefulModelPage(), 
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Inicial',

          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              'Bem-vindo ao Meu App!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stateless_model');
              },
              child: const Text('Ir para Página Stateless'),
            ),

            const SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stateful_model');
              },
              child: const Text('Ir para Página Stateful'),
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
              'Rodapé do Aplicativo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
