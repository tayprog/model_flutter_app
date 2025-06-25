import 'package:flutter/material.dart'; // Importa a biblioteca essencial do Flutter para construir interfaces de usuário com o Material Design.

/// Função principal que inicializa e executa a aplicação Flutter.
/// É o ponto de entrada da sua aplicação, onde a árvore de widgets começa.
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
    // `MaterialApp` é o widget que implementa o Material Design para sua aplicação.
    // Ele fornece funcionalidades essenciais como navegação, temas e sobreposições.
    return MaterialApp(
      // O título da aplicação que aparece no gerenciador de tarefas do dispositivo (Android)
      // ou na barra de título da janela (desktop/web).
      title: 'Hello World',
      // Define o tema visual da aplicação, incluindo cores e tipografia.
      theme: ThemeData(
        // `primarySwatch` gera uma paleta de cores baseada na cor fornecida (aqui, azul).
        // Isso afeta a cor de diversos componentes do Material Design por padrão.
        primarySwatch: Colors.blue,
        // Ajusta a densidade visual dos componentes para se adaptar à plataforma.
        // Por exemplo, em desktop, os elementos podem ter um preenchimento menor para acomodar mais conteúdo.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Define a rota inicial que será carregada quando o aplicativo for iniciado.
      initialRoute: '/',

      // Mapeia rotas nomeadas (strings) para os widgets (telas) correspondentes.
      // Isso facilita a navegação programática entre diferentes partes da aplicação.
      routes: {
        // A rota raiz '/' é mapeada para a tela `HomePage`.
        '/': (context) => const HomePage(),
        // A rota '/test' é mapeada para a tela `TestPage`.
        '/test': (context) => const TestPage(),
        // A rota '/pagesl' é mapeada para a tela `ModelPageSl` (um exemplo de Stateless Widget).
        '/pagesl': (context) => const ModelPageSl(),
        // A rota '/pagesf' é mapeada para a tela `ModelPageSf` (um exemplo de Stateful Widget).
        '/pagesf': (context) => const ModelPageSf(),
      },
    );
  }
}

/// `HomePage` é o widget que representa a tela principal da aplicação.
/// Ele é um `StatelessWidget` porque seu conteúdo (os links para outras páginas)
/// não muda internamente após sua criação.
class HomePage extends StatelessWidget {
  // Construtor padrão para o widget HomePage.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // `Scaffold` é o layout básico do Material Design.
    // Ele fornece uma estrutura visual para a tela, incluindo AppBar, body e BottomNavigationBar.
    return Scaffold(
      // `AppBar` é a barra de título na parte superior da tela.
      appBar: AppBar(
        // O widget `Text` que exibe o título da AppBar.
        title: const Text(
          'Hello World',
          // Estilo do texto do título, definindo cor e peso da fonte para melhor legibilidade.
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Define a cor de fundo da AppBar como azul.
        backgroundColor: Colors.blue,
        // Centraliza o título na AppBar para uma estética padrão do Material Design.
        centerTitle: true,
      ),
      // `body` é o conteúdo principal da tela, localizado abaixo da AppBar.
      body: Center(
        // `Center` alinha seu widget filho (a Column) no centro da tela.
        child: Column(
          // Define como a coluna deve ocupar espaço no eixo principal (vertical).
          // `MainAxisSize.max` faz com que a coluna ocupe o máximo de espaço vertical disponível.
          mainAxisSize: MainAxisSize.max,
          // Alinha os filhos da coluna no eixo cruzado (horizontal).
          // `CrossAxisAlignment.center` centraliza horizontalmente os elementos dentro da coluna.
          crossAxisAlignment: CrossAxisAlignment.center,
          // Alinha os filhos da coluna no eixo principal (vertical).
          // `MainAxisAlignment.center` centraliza verticalmente os elementos dentro da coluna.
          mainAxisAlignment: MainAxisAlignment.center,
          // NOTA: 'spacing' não é uma propriedade padrão do widget `Column`.
          // Se o objetivo é adicionar espaçamento entre os filhos, use `SizedBox`s entre eles.
          // Exemplo: children: [Text('...'), SizedBox(height: 20), Text('...')].
          // Removendo ou ignorando 'spacing' por não ser um parâmetro reconhecido de `Column`.
          // spacing: 20,
          children: [
            // Um widget de texto simples exibindo o título da página.
            const Text('Página inicial'),

            // `InkWell` é um widget que torna seu filho clicável e fornece um efeito visual (ink ripple) ao toque.
            InkWell(
              // O texto que será clicável.
              child: const Text('Página Modelo Stateless'),
              // A ação a ser executada quando o InkWell é tocado.
              // `Navigator.pushNamed` navega para uma rota nomeada específica (`/pagesl`).
              onTap: () => {Navigator.pushNamed(context, '/pagesl')},
            ),

            // Outro `InkWell` para navegar para a página modelo Stateful.
            InkWell(
              // O texto que será clicável.
              child: const Text('Página Modelo Stateful'),
              // Navega para a rota `/pagesf` quando tocado.
              onTap: () => {Navigator.pushNamed(context, '/pagesf')},
            ),
          ],
        ),
      ),
      // `bottomNavigationBar` é uma barra opcional na parte inferior da tela.
      // Embora aqui seja apenas um `Text`, geralmente seria um `BottomNavigationBar` com ícones e rótulos
      // para navegação entre as seções principais do aplicativo.
      bottomNavigationBar: const Text('Rodapé de Hello World!'),
    );
  }
}

/// `ModelPageSl` é uma página modelo que estende `StatelessWidget`.
/// Use esta classe como um template para criar novas páginas/rotas que não
/// necessitam de gerenciamento de estado interno (ou seja, a UI não muda
/// após sua criação, a menos que os dados externos mudem).
///
/// Dica: Atualize este código sempre que precisar, por exemplo, quando
/// "componentizar" alguma estrutura comum entre as páginas (ex: um cabeçalho personalizado).
class ModelPageSl extends StatelessWidget {
  // Construtor padrão para o widget ModelPageSl.
  const ModelPageSl({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um `Scaffold` para fornecer a estrutura básica da página.
    return Scaffold(
      // `AppBar` para o título da página.
      appBar: AppBar(
        // Título da AppBar.
        title: const Text(
          'Página Modelo Stateless',
          // Estilo do texto do título.
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Cor de fundo da AppBar.
        backgroundColor: Colors.blue,
        // Centraliza o título.
        centerTitle: true,
      ),
      // Corpo da página com um texto indicativo.
      // Nota: O texto 'Página Modelo Stateful' aqui parece ser um erro de cópia/colagem,
      // pois esta é a página Stateless.
      body: const Text('Conteúdo da Página Modelo Stateless'),
      // Rodapé da página.
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}

/// `ModelPageSf` é o widget principal para uma página modelo `StatefulWidget`.
/// Use essa classe como um template para criar novas páginas/rotas no aplicativo
/// que precisam de **gerenciamento de estado**. Isso significa que a interface do usuário
/// pode mudar em resposta a interações do usuário ou dados assíncronos,
/// sem que a página inteira seja recriada.
///
/// Dica: Atualize este código sempre que precisar, por exemplo, quando
/// "componentizar" alguma estrutura comum ou padrão de estado.
class ModelPageSf extends StatefulWidget {
  // Construtor padrão para o widget ModelPageSf.
  const ModelPageSf({super.key});

  @override
  // `createState` é chamado pelo framework Flutter para criar o objeto de estado
  // associado a este `StatefulWidget`.
  State<ModelPageSf> createState() => _ModelPageSf();
}

/// `_ModelPageSf` é a classe de estado associada a `ModelPageSf`.
/// É aqui que o estado mutável desta página seria armazenado e gerenciado.
/// O prefixo de sublinhado (`_`) indica que esta classe é privada e só deve ser
/// acessada dentro do arquivo onde foi definida (uma boa prática em Dart).
class _ModelPageSf extends State<ModelPageSf> {
  // TODO: Adicionar variáveis de estado (ex: int _counter = 0;) e métodos para modificá-las (ex: void _incrementCounter() {}).

  @override
  Widget build(BuildContext context) {
    // O método `build` é chamado sempre que o estado do widget é alterado
    // (via `setState`) ou quando as dependências do widget mudam.
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateful',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Text('Conteúdo da página modelo!'),
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}

/// `TestPage` é uma página de teste ou placeholder.
/// Atualmente, ela não possui implementação de UI e serve apenas para "demarcar"
/// páginas futuras que ainda serão desenvolvidas ou preenchidas.
class TestPage extends StatelessWidget {
  // Construtor padrão para o widget TestPage.
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar o conteúdo visual desta tela.
    // Enquanto não for implementado, ele lançará um erro `UnimplementedError`
    // para indicar que a funcionalidade está faltando e evitar que o aplicativo trave inesperadamente.
    throw UnimplementedError();
  }
}