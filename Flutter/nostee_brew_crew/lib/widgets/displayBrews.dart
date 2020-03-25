import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nostee_brew_crew/models/flavors.dart';
import 'package:nostee_brew_crew/models/user.dart';

class DisplayBrews extends StatefulWidget {
  @override
  _DisplayBrewsState createState() => _DisplayBrewsState();
}

class _DisplayBrewsState extends State<DisplayBrews> {
  @override
  Widget build(BuildContext context) {
    print("Provider Stream processing..");
    final myData = Provider.of<List<Flavors>>(context);
    print(Provider.of<User>(context));
    return myData!= null ? ListView.builder(
      itemCount: myData.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(myData[index].name)
        );
      }, 
    ) : Container();
  }
}