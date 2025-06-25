// Aplicativo modelo Dart/Flutter
// Este é um modelo de projeto inicial para criar pequenos aplicativos em Flutter,
// focado em demonstrar a estrutura básica e os tipos de widgets essenciais.

// Importa o pacote de materiais do Flutter, que contém widgets, temas e funcionalidades prontos
// para seguir as diretrizes de design do Material Design do Google.
import 'package:flutter/material.dart';

/// Função principal do aplicativo.
/// É o ponto de entrada da execução de qualquer aplicativo Dart/Flutter.
void main() {
  // `runApp` é a função central do Flutter que recebe um widget e o define como
  // a raiz da árvore de widgets da sua aplicação, exibindo-o na tela.
  runApp(const MyApp());
}

/// `MyApp` é o widget raiz da aplicação.
/// Ele é um `StatelessWidget`, o que significa que seu estado (configurações como tema e rotas)
/// não muda depois de ser criado. Ele define a estrutura geral do aplicativo.
class MyApp extends StatelessWidget {
  // Construtor da classe MyApp. O 'key' é usado pelo Flutter para identificar widgets
  // de forma única na árvore de widgets, importante para otimizações internas.
  const MyApp({super.key});

  @override
  /// O método `build` é chamado pelo Flutter para descrever a interface do usuário
  /// para este widget. Ele deve retornar uma árvore de widgets.
  Widget build(BuildContext context) {
    // `MaterialApp` é um widget especial que encapsula a funcionalidade do Material Design.
    // Ele fornece a base para recursos como navegação, temas, fontes e internacionalização.
    return MaterialApp(
      // `title` define o título do aplicativo que pode ser visto no gerenciador de tarefas
      // do dispositivo ou na aba do navegador (para aplicações web).
      title: 'Meus Apps Flutter',
      // `theme` define o tema visual padrão para toda a aplicação,
      // incluindo cores, tipografia e formas de componentes.
      theme: ThemeData(
        // `primarySwatch` gera uma paleta de cores (variando em tonalidade) baseada no `Colors.blue`.
        // Esta paleta é usada como cor primária por muitos componentes do Material Design.
        primarySwatch: Colors.blue,
        // `visualDensity` ajusta a densidade visual dos componentes para se adaptar à plataforma
        // em que o aplicativo está sendo executado (ex: espaçamento em telas maiores).
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // `initialRoute` define qual rota nomeada será carregada primeiro quando o aplicativo iniciar.
      initialRoute: '/',

      // `routes` é um mapa que define as rotas nomeadas do aplicativo.
      // Ele mapeia um nome de rota (string) para um construtor de widget (que retorna a tela).
      routes: {
        // A rota raiz '/' leva à `HomePage`.
        '/': (context) => const HomePage(),
        // A rota '/stateless_model' leva à `StatelessModelPage`, um exemplo de página sem estado.
        '/stateless_model': (context) => const StatelessModelPage(),
        // A rota '/stateful_model' leva à `StatefulModelPage`, um exemplo de página com estado.
        '/stateful_model': (context) => const StatefulModelPage(),
      },
    );
  }
}

/// `HomePage` é a tela inicial do aplicativo.
/// Ela é um `StatelessWidget` porque seu conteúdo (os botões de navegação)
/// não muda internamente após ser criado.
class HomePage extends StatelessWidget {
  // Construtor da classe HomePage.
  const HomePage({super.key});

  @override
  /// O método `build` descreve a interface do usuário para a `HomePage`.
  Widget build(BuildContext context) {
    // `Scaffold` fornece uma estrutura visual básica para uma tela do Material Design.
    // Inclui a AppBar (barra superior), o body (conteúdo principal) e o BottomNavigationBar (barra inferior).
    return Scaffold(
      // `AppBar` é a barra de título na parte superior da tela.
      appBar: AppBar(
        // `title` é o widget de texto exibido no centro da AppBar.
        title: const Text(
          'Página Inicial',
          // Estilo do texto, definindo negrito. A cor é gerenciada por `foregroundColor`.
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // `backgroundColor` define a cor de fundo da AppBar.
        backgroundColor: Colors.blue,
        // `foregroundColor` define a cor de ícones, textos e outros elementos na AppBar.
        foregroundColor: Colors.white,
        // `centerTitle` alinha o título no centro da AppBar para uma estética padrão.
        centerTitle: true,
      ),
      // `body` é a área principal onde o conteúdo da tela é exibido.
      body: Center(
        // `Center` alinha seu widget filho (a `Column`) no centro da área disponível.
        child: Column(
          // `Column` organiza seus widgets filhos verticalmente, um após o outro.
          // `mainAxisSize.min` faz com que a coluna ocupe apenas o espaço necessário por seus filhos no eixo vertical.
          mainAxisSize: MainAxisSize.min,
          // `crossAxisAlignment.center` alinha os filhos horizontalmente ao centro.
          crossAxisAlignment: CrossAxisAlignment.center,
          // `mainAxisAlignment.center` alinha os filhos verticalmente ao centro dentro do espaço disponível pela coluna.
          mainAxisAlignment: MainAxisAlignment.center,

          // `children` é a lista de widgets que a `Column` irá exibir.
          children: [
            // Texto principal da `HomePage`.
            const Text(
              'Bem-vindo ao Meu App!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            // `SizedBox` é um widget simples usado para adicionar espaço vazio,
            // aqui, um espaço vertical de 32 pixels entre os elementos.
            const SizedBox(height: 32.0),

            // `ElevatedButton` é um botão visualmente elevado (com sombra) que responde a toques.
            // É uma escolha mais comum e intuitiva para botões interativos do que `InkWell` para iniciantes.
            ElevatedButton(
              // `onPressed` é a função chamada quando o botão é pressionado.
              onPressed: () {
                // `Navigator.pushNamed` é usado para navegar para uma nova tela
                // usando o nome da rota definido no `MaterialApp`.
                Navigator.pushNamed(context, '/stateless_model');
              },
              // `child` é o conteúdo visível do botão, neste caso, um texto.
              child: const Text('Ir para Página Stateless'),
            ),
            // Espaçamento vertical entre os botões.
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
      // `bottomNavigationBar` é uma barra opcional na parte inferior da tela,
      // frequentemente usada para navegação entre seções principais do aplicativo.
      bottomNavigationBar: const BottomAppBar(
        color: Colors.blue, // Cor de fundo da barra inferior.
        child: SizedBox(
          height: 50.0, // Altura fixa da barra.
          child: Center(
            child: Text(
              'Rodapé do Aplicativo',
              style: TextStyle(color: Colors.white), // Estilo do texto no rodapé.
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------- MODELOS DE PÁGINAS ----------------------------- //

/// `StatelessModelPage` é um modelo de página simples que estende `StatelessWidget`.
/// Use esta classe como base para criar novas telas que **não precisam mudar**
/// seu conteúdo após serem construídas (ex: páginas de "Sobre", "Configurações estáticas",
/// ou exibição de dados que não se alteram).
class StatelessModelPage extends StatelessWidget {
  // Construtor padrão.
  const StatelessModelPage({super.key});

  @override
  /// O método `build` descreve a interface do usuário para esta página.
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
      // Corpo da página com um exemplo de conteúdo e um botão de retorno.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Esta é uma Página Stateless!',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            // Botão para voltar à tela anterior.
            ElevatedButton(
              onPressed: () {
                // `Navigator.pop` remove a tela atual da pilha de navegação,
                // retornando à tela anterior.
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

/// `StatefulModelPage` é um modelo de página que estende `StatefulWidget`.
/// Use esta classe como base para criar novas telas que **precisam mudar**
/// seu conteúdo e comportamento em tempo real (ex: contadores, formulários,
/// exibir dados de API que podem ser atualizados dinamicamente).
class StatefulModelPage extends StatefulWidget {
  // Construtor padrão.
  const StatefulModelPage({super.key});

  @override
  // `createState` é chamado pelo Flutter para criar o objeto de estado
  // associado a este `StatefulWidget`. Este método é chamado apenas uma vez
  // quando o widget é inserido na árvore.
  State<StatefulModelPage> createState() => _StatefulModelPageState();
}

/// `_StatefulModelPageState` é a classe de estado associada a `StatefulModelPage`.
/// É aqui que o estado mutável desta página é armazenado e gerenciado.
/// O prefixo de sublinhado (`_`) indica que esta classe é privada e só deve ser
/// acessada dentro do arquivo onde foi definida (uma boa prática em Dart).
class _StatefulModelPageState extends State<StatefulModelPage> {
  // Exemplo de variável de estado: um contador que pode ser alterado.
  // Variáveis de estado devem ser declaradas dentro da classe `State`.
  int _counter = 0;

  /// Método para incrementar o contador e atualizar a interface do usuário.
  /// `setState()` é essencial! Ele notifica o Flutter que o estado mudou
  /// e que o método `build` precisa ser executado novamente para reconstruir
  /// a parte da UI que depende desse estado.
  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa o valor do contador.
    });
  }

  @override
  /// O método `build` é chamado sempre que o estado do widget é alterado
  /// (via `setState()`) ou quando as dependências do widget mudam.
  /// Ele descreve a interface do usuário atual com base no estado.
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
            // Exibe o valor atual do contador. O texto será atualizado quando o contador mudar.
            Text(
              'Contador: $_counter',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Botão para incrementar o contador.
            ElevatedButton(
              onPressed: _incrementCounter, // Chama o método para incrementar o contador.
              child: const Text('Incrementar Contador'),
            ),
            const SizedBox(height: 20),
            // Botão para voltar à tela anterior.
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