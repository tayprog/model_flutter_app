import 'package:flutter/material.dart'; // Importa a biblioteca essencial do Flutter para construir interfaces de usuário com o Material Design.

/// Função principal que inicializa e executa a aplicação Flutter.
/// É o ponto de entrada da sua aplicação.
void main() {
  // `runApp` recebe o widget raiz da sua aplicação e o exibe na tela.
  // `const MyApp()` cria uma instância da classe MyApp, que é o nosso widget principal.
  // O uso de `const` aqui indica que este widget e seus filhos podem ser criados em tempo de compilação, otimizando o desempenho.
  runApp(const MyApp());
}

/// `MyApp` é o widget raiz da aplicação.
/// Ele estende `StatelessWidget` porque seu estado não muda durante a vida útil do widget.
/// Define a estrutura geral da aplicação, incluindo tema e rotas de navegação.
class MyApp extends StatelessWidget {
  // Construtor para MyApp. `super.key` é usado para identificar o widget de forma única na árvore de widgets.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // `MaterialApp` é o widget que implementa o Material Design.
    // Ele fornece funcionalidades como navegação, temas e sobreposições.
    return MaterialApp(
      // O título da aplicação que aparece no gerenciador de tarefas do dispositivo ou na aba do navegador.
      title: 'Hello World',
      // Define o tema visual da aplicação.
      theme: ThemeData(
        // `primarySwatch` gera uma paleta de cores baseada na cor fornecida (aqui, azul).
        primarySwatch: Colors.blue,
        // Ajusta a densidade visual dos componentes para se adaptar à plataforma.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Define a rota inicial que será carregada quando o aplicativo for iniciado.
      initialRoute: '/',

      // Mapeia rotas nomeadas para os widgets correspondentes.
      // Isso facilita a navegação entre diferentes telas da aplicação.
      routes: {
        // A rota raiz '/' é mapeada para a tela `Home`.
        '/': (context) => const Home(),
        // A rota '/test' é mapeada para a tela `Test`.
        '/test': (context) => const Test(),
      },
    );
  }
}

/// `Home` é o widget que representa a tela principal da aplicação.
/// Ele também é um `StatelessWidget` pois seu conteúdo não muda internamente após a criação.
class Home extends StatelessWidget {
  // Construtor padrão para o widget Home.
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // `Scaffold` é um widget que implementa a estrutura básica do Material Design,
    // fornecendo uma estrutura visual como AppBar, body e BottomNavigationBar.
    return Scaffold(
      // `AppBar` é a barra de título na parte superior da tela.
      appBar: AppBar(
        // O título da AppBar.
        title: const Text(
          'Hello World',
          // Estilo do texto do título, definindo cor e peso da fonte.
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Cor de fundo da AppBar.
        backgroundColor: Colors.blue,
        // Centraliza o título na AppBar.
        centerTitle: true,
      ),
      // `body` é o conteúdo principal da tela, localizado abaixo da AppBar.
      body: const Text('Conteúdo de Olá Mundo!'),
      // `bottomNavigationBar` é uma barra opcional na parte inferior da tela.
      // Geralmente usada para navegação entre seções principais, mas aqui é um Text simples.
      bottomNavigationBar: const Text('Rodapé de Hello World!'),
    );
  }
}

/// `Test` é um widget de tela de exemplo para demonstração de navegação.
/// Atualmente, ele lança um erro, pois sua implementação ainda está pendente.
class Test extends StatelessWidget {
  // Construtor padrão para o widget Test.
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar o conteúdo visual desta tela.
    // Enquanto não for implementado, ele lançará um erro UnimplementedError.
    throw UnimplementedError();
  }
}