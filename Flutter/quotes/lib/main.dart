import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
  home: FamousLastWords()
));

class FamousLastWords extends StatefulWidget {
  @override
  _FamousLastWordsState createState() => _FamousLastWordsState();
}

class _FamousLastWordsState extends State<FamousLastWords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Famous Last Words"
        )
      ),
      );
  }
}

//-------------------------------------------------------------//
