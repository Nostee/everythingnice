import 'package:flutter/material.dart';
import 'package:http/http.dart';
import "dart:convert";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getTime() async
  {
    Response manila = await get("http://worldtimeapi.org/api/timezone/Asia/Manila");
    Map time = jsonDecode(manila.body);
    String date = time["datetime"];
    String offset = time["utc_offset"].substring(1,3);

    DateTime dt = DateTime.parse(date);
    dt = dt.add(Duration(hours: int.parse(offset)));
    print("Time in manila is $dt");
  }

  @override
  void initState() {
    super.initState();
    print("Getting data..");
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "LOADING",
          style: TextStyle(
            letterSpacing: 4
          )
        )
      )
    );
  }
}
