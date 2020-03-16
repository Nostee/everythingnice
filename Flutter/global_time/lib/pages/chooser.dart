import 'package:flutter/material.dart';
import 'package:globaltime/getWorldTime.dart';

class Chooser extends StatefulWidget {
  @override
  _ChooserState createState() => _ChooserState();
}

class _ChooserState extends State<Chooser> {

  List<GetWorldTime> myData = [
    GetWorldTime(location: "Manila",url: "Asia/Manila"),
    GetWorldTime(location: "New York",url: "America/New_York"),
    GetWorldTime(location: "Tokyo",url: "Asia/Tokyo"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Choose a location:",
          style: TextStyle(
            letterSpacing: 2
          )
        )
      ),
      body: ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context,index) {
          return ListTile(
            onTap: () async {
              GetWorldTime gwt = myData[index];
              await gwt.setUpTime();
              Navigator.pop( context,{
                "location" : gwt.location,
                "time" : gwt.time,
                "currentUrl" : gwt.url,
              });
            },
            title: Card(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  myData[index].location,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2,
                )
              ),
            ))
          );
        }
      )
    );
  }
}
