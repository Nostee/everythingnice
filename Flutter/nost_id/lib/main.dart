import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: NosteeID()
));

class NosteeID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[800],
        title: Text(
            "NOSTEE'S IDENTIFICATION CARD",
          style: TextStyle(
            color: Colors.blueGrey[200],
            fontSize: 10,
            letterSpacing: 2,
            fontFamily: 'Pixeled',
          )
        )
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:20),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/Nostee_Icon.png"),
                radius: 50
              ),
            ),
            Divider(
              height:75,
              color: Colors.blueGrey[200]
            ),
            Text(
                "Real Name: ",
              style: TextStyle(
                fontSize: 10,
                fontFamily: "Pixeled",
                color: Colors.blueGrey[600]
              ),
            ),
            Text(
              "Jedidiah David H. Calayag",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[200]
              ),
            ),
            Text(
              "Birthday",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[600]
              ),
            ),
            Text(
              "08/25/99",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[200]
              ),
            ),
            Text(
              "Profession(s)",
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[600]
              ),
            ),
            Text(
              "Digital Artist",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[200]
              ),
            ),
            Text(
              "Programmer",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[200]
              ),
            ),
            Text(
              "Musician",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Pixeled",
                  color: Colors.blueGrey[200]
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(
                    Icons.email,
                    color: Colors.blueGrey[300]
                ),
                SizedBox(width: 10),
                Text(
                    "nosteeeeeee@gmail.com",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(
                    Icons.laptop_chromebook,
                    color: Colors.blueGrey[300]
                ),
                SizedBox(width: 10),
                Text(
                    "LINKS",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: <Widget>[
                SizedBox(width: 35),
                Text(
                    "facebook.com/nostdoro",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 35),
                Text(
                    "twitter.com/nostdoro",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 35),
                Text(
                    "patreon.com/nostee",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 35),
                Text(
                    "ko-fi.com/nostee",
                    style: TextStyle(
                        fontFamily: "Avenir",
                        letterSpacing: 2,
                        color: Colors.blueGrey[300]
                    )
                )
              ],
            ),
          ],
        )

      )
    );
  }
}



