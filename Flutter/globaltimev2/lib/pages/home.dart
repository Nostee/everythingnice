import 'package:flutter/material.dart';
import 'package:globaltimev2/clock.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  dynamic storedData;
  String location = "choose a";
  String time = "location";
  String url;

  void refresh() async
  {
    bool x = true;
    while(x==true)
      {
        await Future.delayed(Duration(seconds:3), () async {
          print("Refreshing..");
          Clock wew = Clock(location: location,url: url);
          await wew.getTime();
          time = wew.time;
          setState(() {});
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton.icon(
                  onPressed: ()  async{
                    storedData = await Navigator.pushNamed(context, "/chooser");
                    location = storedData["location"];
                    time = storedData["time"];
                    url = storedData["url"];
                    setState(() {});
                    refresh();
                  },
                  icon: Icon(Icons.location_on),
                  label: Text(
                      "Edit Location",
                    style: TextStyle(
                      letterSpacing: 2,
                    ),
                  )
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w100
                    ),
                  )
                ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: 85,
                          fontWeight: FontWeight.w100
                      ),
                    )
                  ]
              ),
            ],
          ),
        )
      )
    );
  }
}
