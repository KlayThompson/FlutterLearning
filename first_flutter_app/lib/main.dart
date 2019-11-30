import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text('Hello World'),
//            child: new RandomWords(),
//        ),
//      ),
//    );
//  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Startup Name Generator',
      theme: new ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<prefix0.WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);
  return new Scaffold(
    appBar: new AppBar(
      title: new Text('Startup Name Generator'),
      actions: <Widget>[
        new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
      ],
    ),
    body: _buildSuggestions(),
  );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(prefix0.generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  //返回widget
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  //空方法
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                (pair) {
                  return new ListTile(
                    title: new Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                    ),
                  );
                }
            );
            final divided = ListTile.divideTiles(
                tiles: tiles,
                context: context,
            )
            .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided,),
            );
          },
      ),
    );
  }

}