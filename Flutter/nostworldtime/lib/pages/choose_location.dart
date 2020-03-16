import 'package:flutter/material.dart';
import "package:nostworldtime/services/worldTime.dart";

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: "Manila",country: "Asia/Manila"),
    WorldTime(location: "London",country: "Europe/London"),
  ];

  void updateData(index) async
  {
    try{
      WorldTime wt = locations[index];
      await wt.getTime();
      Navigator.pop(context, {
        "location": wt.location,
        "currentTime": wt.currentTime,
      });
    }
    catch(e)
    {
      print("!!!!!!!!Error is $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
            "Choose a location:",
          style: TextStyle(
            letterSpacing: 4,
          ),
        )
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index) {
          return ListTile(
            onTap: () {
              updateData(index);
            },
            title: Text(
                locations[index].location,
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 25,
              ),
            ),
          );
        },
      )
    );
  }
}
