import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Clock
{
  String location;
  String url;
  String time;

  Clock({this.location,this.url});

  Future<void> getTime() async
  {
    print("Location is $location");
    print("Url is $url");
    print("loading..");

    Response rp = await get("http://worldtimeapi.org/api/timezone/$url");
    Map mp = jsonDecode(rp.body);
    print("map retrieved!");
    DateTime dt = DateTime.parse(mp["datetime"]);
    print("date time retrieved!");
    dt = dt.add(Duration(hours: int.parse(mp["utc_offset"].substring(1,3))));
    time = DateFormat.jm().format(dt);
    print(time);
  }
}