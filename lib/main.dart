import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange)),
      home: RandomWords(),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _favorite = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose the text'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: _saved
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _saved() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (context) {
              final data = _favorite.map(
                    (pair) {
                  return ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                },
              );
              final divided = data.isNotEmpty ?
              ListTile.divideTiles(
                context: context,
                tiles: data,
              ).toList() : <Widget>[];
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Saved the text'),
                ),
                body: ListView(children: divided),
              );
            }
        )
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();/*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final toggleFavorite = _favorite.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: IconButton(
        icon: Icon(
          toggleFavorite ? Icons.favorite : Icons.favorite_border,
          color: toggleFavorite ? Colors.red : null,
          semanticLabel: toggleFavorite ? 'Remove from saved' : 'Save',
        ),
        onPressed: () {
          setState(() {
            if (toggleFavorite) {
              _favorite.remove(pair);
            } else {
              _favorite.add(pair);
            }
          });
        },

      ),
      onTap: () {
        print("Pressed ${pair.asPascalCase}");
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
