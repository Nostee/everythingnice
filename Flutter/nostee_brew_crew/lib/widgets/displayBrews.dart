import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nostee_brew_crew/models/flavors.dart';

class DisplayBrews extends StatefulWidget {
  @override
  _DisplayBrewsState createState() => _DisplayBrewsState();
}

class _DisplayBrewsState extends State<DisplayBrews> {
  @override
  Widget build(BuildContext context) {
    print("Provider Stream processing..");
    final myData = Provider.of<List<Flavors>>(context);
    return myData!= null ? Container(
      child: ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.brown[myData[index].strength],
                ),
                title: Text(
                  myData[index].name,
                  ),
                subtitle: Text(
                  "Takes ${myData[index].sugars} sugar(s)"
                ),
            ),
          );
        }, 
      ),
    ) : Container();
  }
}