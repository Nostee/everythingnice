import 'dart:io';
import 'package:flutter/material.dart';
import 'package:globaltime/getWorldTime.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String location = "please choose a";
  String time = "location";
  dynamic data;

  @override
  void initState() {
    super.initState();
  }

  void timeRefresh() async
  {
    bool x = true;
    while(x==true)
      {
        await Future.delayed(Duration(seconds: 5),() async {
          print("Refresh!");
          GetWorldTime gwt = GetWorldTime(location: location,url: data["currentUrl"]);
          await gwt.setUpTime();
          time = gwt.time;
          setState((){
          });
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: FlatButton.icon(
                onPressed: () async {
                  data = await Navigator.pushNamed(context, "/chooser");
                  location = data["location"];
                  time = data["time"];
                  timeRefresh();
                },
                icon: Icon(Icons.location_on),
                label: Text(
                    "Edit Location",
                  style: TextStyle(
                    letterSpacing: 2,
                  )
                ),
              ),
            ),
            SizedBox(height: 250),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  location,
                  style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 50,
                    fontWeight: FontWeight.w100
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    time,
                    style: TextStyle(
                    letterSpacing: 2,
                    fontSize: 100,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
          ],
        )
      )
    );
  }
}
