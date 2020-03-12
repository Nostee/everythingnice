import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatelessWidget {
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
                  fontSize: 25
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
                "1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                )
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
                    fontSize: 13
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
