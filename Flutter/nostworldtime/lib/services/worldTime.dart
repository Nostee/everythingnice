import 'package:http/http.dart';
import "dart:convert";

import 'package:intl/intl.dart';

class WorldTime
{
  String location;
  String currentTime;
  String country;
  bool dayTime;

  WorldTime({this.location,this.country});

  Future<void> getTime() async
  {
    Response count = await get("http://worldtimeapi.org/api/timezone/$country");
    Map time = jsonDecode(count.body);
    String date = time["datetime"];
    String offset = time["utc_offset"].substring(1,3);

    DateTime dx = DateTime.parse(date);
    dx = dx.add(Duration(hours: int.parse(offset)));

    currentTime = DateFormat.jm().format(dx);
    dayTime = dx.hour>6 && dx.hour<18 ? true : false;
  }
}