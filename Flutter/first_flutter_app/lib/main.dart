import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "THE NOST APP",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Avenir",
                    color: Colors.teal,
                  letterSpacing: 17
                )
            ),
            centerTitle: true,
            backgroundColor: Colors.black87,
        ),
        body: Center(


        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {} ,
            child: Text("+"),
            backgroundColor: Colors.black87,
        ),
    );
  }
}
