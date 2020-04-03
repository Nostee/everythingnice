import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_adventures/services/authenticator.dart';
import 'package:text_adventures/widgets/loadingText.dart';

// this is called by register.dart

class LoaderRegister extends StatefulWidget {
  @override
  _LoaderRegisterState createState() => _LoaderRegisterState();
}

class _LoaderRegisterState extends State<LoaderRegister> {
  Map fetchedData;
  dynamic temporaryData;
  dynamic temporaryData2;
  dynamic uid;

  Future<void> fetchingData() async
  {
    try
    {
      print("(loaderRegister.dart)Fetched mapped data is $fetchedData"); // debug
      print("(loaderRegister.dart)Trying to register with these data..."); // debug
      temporaryData = await Authenticator().register(fetchedData["email"],fetchedData["password"]);
      print("(loaderRegister.dart)Temporary data: $temporaryData"); // debug

      if(temporaryData!=null)
      {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "home.dart");
      }
      else
      {
        Navigator.pushReplacementNamed(context, "register.dart", arguments: {
          "error" : "Email invalid. Please try again, noob."
        });
      }
    }
    catch(e)
    {
      print("(loaderRegister.dart)An error occured!"); // debug
      print("(loaderRegister.dart)ERROR: $e"); // debug
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchedData = ModalRoute.of(context).settings.arguments;
    fetchingData();
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SpinKitCubeGrid(
              color: Colors.white,
              size: 100.0,        
              )
            ),
            Center(
              child: SizedBox(height:40)
            ),
            Center(
              child: LoadingText()
            ),
        ],)
      );
  }
}