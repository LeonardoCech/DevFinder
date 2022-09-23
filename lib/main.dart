import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const primaryColor = Colors.cyan;
const secondaryColor = Colors.orange;

const filtersLabels = [
  ['Backend', 90.0],
  ['JavaScript', 101.0],
  ['Python', 82.0],
  ['DevOps', 86.0],
  ['CI/CD', 76.0],
  ['GCP Tasks', 102.0],
  ['AWS S3', 87.0],
  ['AWS Lambda', 116.0],
  ['PMBOK', 86.0]
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // Instanciando o aplicativo
  const MyApp({super.key});

  // Construíndo o Widget base
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'DevFinder',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const DevFinder(),
    );
  }
}

class DevFinder extends StatefulWidget {

  const DevFinder({super.key});

  @override
  State<DevFinder> createState() => _DevFinderState();
}

class Dev {
  String fullname;
  String from;
  String mainStack;
  String age;
  String experience;
  String profileUrl;

  Dev(
    this.fullname,
    this.from,
    this.mainStack,
    this.age,
    this.experience,
    this.profileUrl
  );
}

class _DevFinderState extends State<DevFinder> {

  final _devs = <Dev>[],
        _saved = <Dev>{},
        _biggerFont = const TextStyle(fontSize: 18);

  /* Renderização de lista infinita
    Lista finita (padrão): Carrega todos os items de uma única vez, mesmo que
      estes não sejam apresentados em tela
    Lista infinita: Carrega somente uma parte dos items, relativo à iqual parte
      da lista está sendo apresentada, otimizando o uso de memória excessivo.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withAlpha(30),
      appBar: AppBar(
        title: Image.asset(
            'assets/images/logo.png',
            scale: 4
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    )
                ),
                child: const ListTile(
                    title: Text(
                      "Jaraguá do Sul - SC",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black45
                      )
                    ),
                  trailing: Icon(
                    Icons.search_rounded,
                    color: Colors.black45,
                    semanticLabel: 'Buscar',
                  )
                )
            )
          ),
          Wrap(
            children: filtersBadges(filtersLabels)
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "5 profissionais encontrados",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                      )
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topRight,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Atende a todos',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45
                          )
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.black45,
                          semanticLabel: 'Remover filtro',
                        )
                      ]
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.topRight,
                    decoration: const BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      )
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Filtros',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45
                          )
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.black45,
                          semanticLabel: 'Remover filtro',
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ),
          Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {

                  if (i.isOdd) return const Divider();

                  final index = i ~/ 2;

                  Dev dev_0 = Dev(
                    "Luíz Amilton",
                    "Jaraguá do Sul - SC",
                    "Python, JavaScript, Ruby",
                    "37 anos de idade",
                    "17 anos de experiência",
                    "https://i1.wp.com/telaviva.com.br/wp-content/uploads/2022/03/hamilton.jpg?resize=321%2C235&ssl=1"
                  );
                  _devs.add(dev_0);

                  Dev dev_1 = Dev(
                      "July Étte Feitosa",
                      "Jaraguá do Sul - SC",
                      "AWS DynamoDB, JavaScript",
                      "32 anos de idade",
                      "7 anos de experiência",
                      "https://portalpopline.com.br/wp-content/uploads/2021/04/thais-bbb-21.jpg"
                  );
                  _devs.add(dev_1);

                  Dev dev_2 = Dev(
                      "Paulo Malone",
                      "Jaraguá do Sul - SC",
                      "JavaScript, CI/CD, DevOps",
                      "27 anos de idade",
                      "5 anos de experiência",
                      "https://i.redd.it/li8lal9ugwy51.png"
                  );
                  _devs.add(dev_2);

                  Dev dev_3 = Dev(
                      "Dueine Johnson da Rocha",
                      "Jaraguá do Sul - SC",
                      "JavaScript, Python, DevOps... +10",
                      "50 anos de idade",
                      "32 anos de experiência",
                      "https://ogimg.infoglobo.com.br/in/19992652-555-bdc/FT1086A/201608251229371527_AP.jpg"
                  );
                  _devs.add(dev_3);

                  Dev dev_4 = Dev(
                      "Thomas Holanda",
                      "Jaraguá do Sul - SC",
                      "Python, AWS Lambda",
                      "26 anos de idade",
                      "5 anos de experiência",
                      "https://img2.rtve.es/i/?w=1600&i=1660466777410.jpg"
                  );
                  _devs.add(dev_4);

                  final alreadySaved = _saved.contains(_devs[index]);

                  return Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            width: 160,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(_devs[index].profileUrl)
                              )
                            ),
                          ),
                          SizedBox(
                            width: 260,
                            child: Column(
                              children: [
                                Text(
                                  _devs[index].fullname,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 2,
                                    color: Colors.black54
                                  )
                                ),
                                Text(
                                  _devs[index].from,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 2,
                                    color: Colors.black54
                                  )
                                ),
                                Text(
                                  _devs[index].experience,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 2,
                                    color: Colors.black54
                                  )
                                ),
                                Text(
                                  _devs[index].age,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 2,
                                    color: Colors.black54
                                  )
                                ),
                                Text(
                                  _devs[index].mainStack,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 2,
                                    color: Colors.black54
                                  )
                                )
                              ],
                            )
                          )
                        ]
                      ),
                      /*
                      title: Text(
                        _devs[index].fullname,
                        style: _biggerFont,
                      ),
                      */
                      trailing: Icon(
                        alreadySaved ? Icons.bookmark : Icons.bookmark_border,
                        color: alreadySaved ? Colors.cyan.shade500 : null,
                        semanticLabel: alreadySaved ? 'Remover das curtidas' : 'Curtir',
                      ),
                      onTap: () {
                        setState(() {
                          if (alreadySaved) {
                            _saved.remove(_devs[index]);
                          } else {
                            _saved.add(_devs[index]);
                          }
                        });
                      },
                    )
                  );
                }
              )
          )
        ]
      )
    );
  }

  // Ação para salvar um item
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.fullname,
                  style: _biggerFont,
                ),
              );
            },
          ),
          divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Devs salvos'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  List<Widget> filtersBadges(labelsList) {
    var children = <Widget>[];
    for (var label in labelsList) {
      children.add(
        Container(
          width: label[1],
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.only(top: 3.0, right: 10.0, bottom: 3.0, left: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              )
          ),
          child: Row(
            children: [
              Text(
                label[0],
                style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45
                )
              ),
              const Icon(
                Icons.remove,
                color: Colors.black45,
                semanticLabel: 'Remover filtro',
              )
            ]
          )
        )
      );
    }
    return children;
  }
}