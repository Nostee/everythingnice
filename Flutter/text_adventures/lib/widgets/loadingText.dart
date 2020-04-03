import 'package:flutter/material.dart';

// this is responsible for the varying text under the spinkit.
// note: Slight buggy but it will do. 

class LoadingText extends StatefulWidget {
  @override
  _LoadingTextState createState() => _LoadingTextState();
}

class _LoadingTextState extends State<LoadingText> {

  bool loop = true;
  bool ctr = true;

  void changeText() async
  {
    try
    {
      while(loop==true)
      {
        await Future.delayed(Duration(seconds: 2),() 
        {
          setState(() {
            if(ctr==true)
            {
              ctr = false;
            }
            else
            {
              ctr = true;
            }
          });
        });
      }
    }
    catch(e){}
  }

  @override
  Widget build(BuildContext context) {
    changeText();
    return ctr==true ? Text(
      " SETTING UP THE CAMPFIRE..",
      style: TextStyle(
        fontFamily: "Pixelated",
        fontSize: 20,
        color: Colors.white
      )
      ): Text(
      " SETTING UP THE CAMPFIRE...",
      style: TextStyle(
        fontFamily: "Pixelated",
        fontSize: 20,
        color: Colors.white
      )
      );
  }
}