import 'package:flutter/material.dart';
import 'package:globaltimev2/clock.dart';

class Chooser extends StatefulWidget {
  @override
  _ChooserState createState() => _ChooserState();
}

class _ChooserState extends State<Chooser> {

  List<Clock> clockList = [
    Clock(location: "Manila",url: "Asia/Manila"),
    Clock(location: "New York",url: "America/New_York"),
    Clock(location: "Tokyo",url: "Asia/Tokyo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "LOCATIONS:",
          style: TextStyle(
            letterSpacing: 4,
            fontWeight: FontWeight.w200,
          ),
        )
      ),
      body: ListView.builder(
        itemCount: clockList.length,
        itemBuilder: (context,index) {
          return ListTile(
            onTap: () async {
              Clock cl = Clock(location: clockList[index].location,url: clockList[index].url);
              await cl.getTime();
              Navigator.pop(context, {
                "location" : cl.location,
                "url" : cl.url,
                "time" : cl.time,
              });
            },
            title: Text(
              clockList[index].location,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 40,
                fontWeight: FontWeight.w200,
              )
            ),
          );
        }

      )
    );
  }
}
