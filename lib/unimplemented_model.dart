import 'package:flutter/material.dart';

// Página vazia (Não implementada),
// usada apenas para "demarcar" páginas futuras.
class TestPage extends StatelessWidget {
  // Construtor da classe TestPage.
  const TestPage({super.key});

  @override
  // O método build para TestPage não está implementado, o que fará com que um erro seja lançado se a página for acessada.
  Widget build(BuildContext context) {
    // TODO: implement build // Este comentário indica que a implementação está pendente.
    throw UnimplementedError(); // Lança um erro indicando que a funcionalidade não foi implementada.
  }
}
