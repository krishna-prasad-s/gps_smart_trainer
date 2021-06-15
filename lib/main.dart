// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'myLayout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS TRAINER',
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
      home: RandomWords(),
      routes: <String, WidgetBuilder>{
        "/route" : (BuildContext context) => new myLayout(),
      },
    );
  }
}


class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _fontSize = const TextStyle(fontSize: 18.0);
  final _saved = <WordPair>{};

  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if(i.isOdd) return const Divider();

          final index = i ~/2;
          if(index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fontSize,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.blue : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes'),
        actions: [
          IconButton(icon:Icon(Icons.account_tree_outlined), onPressed: _pushDetail),
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushDetail() {
    Navigator.of(context).pushNamed("/route");
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void> (
        builder: (BuildContext context) {
          final titles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _fontSize,
                  ),
                );
              },
          );
          final divided = titles.isNotEmpty ?
              ListTile.divideTiles(tiles: titles, context: context).toList()
              : <Widget>[];
          return Scaffold(
            appBar: AppBar(
              title: Text('fav locations'),
            ),
            body: ListView(children: divided),
          );

        }
      ),
      
    );

  }
}
