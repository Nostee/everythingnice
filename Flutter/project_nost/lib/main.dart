import 'package:flutter/material.dart';
import "quotes.dart";
import "quoteTemplate.dart";

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myLevel = 0;
  List<Quotes> myQuote = [
    Quotes(text: "If you're hungry, eat.",author: "Luffy"),
    Quotes(text: "Everthing sucks.",author: "Introvert Boi")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "Identification Card",
          style: TextStyle(
            letterSpacing: 2,
          )
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          setState(() {
            myLevel = myLevel+1;
            print("Log: Added some level!");
          });
        },
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/Nostee Icon.png"),
                radius: 45
              ),
            ),
            Divider(
              height: 50,
              color: Colors.white
            ),
            Text(
                "NAME",
              style: TextStyle(
                letterSpacing: 4,
                color: Colors.white38,
              )
            ),
            SizedBox(height: 5),
            Text(
                "Jedidiah David H. Calayag",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 20),
            Text(
                "LEVEL",
                style: TextStyle(
                  letterSpacing: 4,
                  color: Colors.white38,
                )
            ),
            SizedBox(height: 5),
            Text(
                "$myLevel",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(height: 20),
            Text(
                "FAVORITE QUOTES",
              style: TextStyle(
                letterSpacing: 4,
                color: Colors.white38,
              )
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: myQuote.map((x) {
                return QuoteTemplate(
                    myQuote: x,
                    delete: () {
                      setState(() {
                        myQuote.remove(x);
                      });
                    }
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.white38
                ),
                SizedBox(width: 5),
                Text(
                  "nosteeeeeee@gmail.com",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 13,
                    letterSpacing: 2
                  )
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

