import 'package:flutter/material.dart';
import "quotes.dart";

class QuoteTemplate extends StatefulWidget {
  final Quotes myQuote;
  final Function delete;
  QuoteTemplate({this.myQuote,this.delete});

  @override
  _QuoteTemplateState createState() => _QuoteTemplateState();
}

class _QuoteTemplateState extends State<QuoteTemplate> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20,5,5,5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Text(
                  "${widget.myQuote.text}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  )
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 6,
              child: Text(
                "by ${widget.myQuote.author}",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white38
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 6,
              child: FlatButton.icon(
                  icon: Icon(Icons.delete,
                  color: Colors.white30
                  ),
                  label: Text("Delete",
                  style: TextStyle(
                      color: Colors.white30
                  )
                  ),
                  onPressed: () {
                    widget.delete();
                  }
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
