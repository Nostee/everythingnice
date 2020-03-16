import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetWorldTime
{
  String location;
  String url;
  String time;

  GetWorldTime({this.location,this.url});

  Future<void> setUpTime() async
  {
      Response rp = await get("http://worldtimeapi.org/api/timezone/$url");
      Map mp = jsonDecode(rp.body);
      DateTime dt = DateTime.parse(mp["datetime"]);

      String offset = mp["utc_offset"].substring(1,3);
      int addedHour = int.parse(offset);
      dt = dt.add(Duration(hours: addedHour));
      time = DateFormat.jm().format(dt);
  }
}