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
        // A rota raiz '/' é mapeada para a tela `HomePage`.
        '/': (context) => const HomePage(),
        // A rota '/test' é mapeada para a tela `TestPage`.
        '/test': (context) => const TestPage(),
        // A rota '/pagesl' é mapeada para a tela `ModelPageSl` (Stateless).
        '/pagesl': (context) => const ModelPageSl(),
        // A rota '/pagesf' é mapeada para a tela `ModelPageSf` (Stateful).
        '/pagesf': (context) => const ModelPageSf(),
      },
    );
  }
}

/// `HomePage` é o widget que representa a tela principal da aplicação.
/// Ele também é um `StatelessWidget` pois seu conteúdo e comportamento não mudam após a criação.
class HomePage extends StatelessWidget {
  // Construtor padrão para o widget HomePage.
  const HomePage({super.key});

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
        // Centraliza o título na AppBar para uma estética padrão do Material Design.
        centerTitle: true,
      ),
      // `body` é o conteúdo principal da tela, localizado abaixo da AppBar.
      body: Center(
        // `Center` centraliza seu widget filho (a Column) na tela.
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
          // `spacing` é uma propriedade customizada (não é um widget padrão do Flutter,
          // pode ser um erro de digitação ou um widget customizado não incluído no contexto).
          // Em um `Column` padrão, o espaçamento entre itens é geralmente tratado com `SizedBox`s.
          // Ignorando `spacing` pois não é uma propriedade padrão de `Column`.
          // Se for um widget customizado, este comentário precisaria ser ajustado.
          // O correto para espaçamento em uma Column seria usar SizedBox entre os children.
          // Exemplo: SizedBox(height: 20),
          children: [
            // Um widget de texto simples.
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
/// Use essa classe como um template para criar novas páginas/rotas que não
/// necessitam de gerenciamento de estado interno.
///
/// Dica: atualize este código sempre que precisar, por exemplo, quando
/// "componentizar" alguma estrutura comum entre as páginas.
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
      body: const Text('Página Modelo Stateful'), // Nota: O texto aqui pode estar incorreto, pois a página é Stateless.
      // Rodapé da página.
      bottomNavigationBar: const Text('Rodapé da págna modelo!'),
    );
  }
}

/// `ModelPageSf` é uma página modelo que estende `StatefulWidget`.
/// Este widget seria usado como um template para páginas que precisam
/// gerenciar estado mutável, ou seja, dados que podem mudar após a criação inicial
/// do widget, causando uma reconstrução da UI.
///
/// **NOTA**: A implementação real de um `StatefulWidget` requer duas classes:
/// uma para o widget (`ModelPageSf`) e outra para o estado (`_ModelPageSfState`).
/// Atualmente, esta classe não está implementada.
class ModelPageSf extends StatefulWidget {
  const ModelPageSf({super.key});

  @override
  State<ModelPageSf> createState() => _ModelPageSfState();
}

/// A classe de estado associada a `ModelPageSf`.
/// É aqui que o estado mutável desta página seria armazenado e gerenciado.
class _ModelPageSfState extends State<ModelPageSf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página Modelo Stateful',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Conteúdo da Página Modelo Stateful'),
      ),
      bottomNavigationBar: const Text('Rodapé da página modelo Stateful!'),
    );
  }
}


/// `TestPage` é uma página de teste/placeholder.
/// Atualmente, não possui implementação de UI e é usada para "demarcar"
/// páginas futuras que ainda serão desenvolvidas.
class TestPage extends StatelessWidget {
  // Construtor padrão para o widget TestPage.
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implementar o conteúdo visual desta tela.
    // Enquanto não for implementado, ele lançará um erro `UnimplementedError`
    // para indicar que a funcionalidade está faltando.
    throw UnimplementedError();
  }
}