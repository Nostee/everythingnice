import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map myData = {};

  @override
  Widget build(BuildContext context) {
    myData = myData.isNotEmpty ? myData : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context,"/chooseLocation");
                  myData = {
                    "location": result["location"],
                    "currentTime": result["currentTime"]
                  };
                  setState(() {});
                },
                icon: Icon(Icons.location_on),
                label: Text("Edit Location",
                style: TextStyle(
                  letterSpacing: 2,
                ),
                )
              ),
              SizedBox(height:250),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      myData["location"],
                    style: TextStyle(
                      letterSpacing: 10,
                      fontSize: 30
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    myData["currentTime"],
                    style: TextStyle(
                        letterSpacing: 10,
                        fontSize: 60
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
