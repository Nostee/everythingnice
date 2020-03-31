import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_adventures/services/authenticator.dart';
import 'package:text_adventures/widgets/loadingText.dart';

class LoaderLogin extends StatefulWidget {
  @override
  _LoaderLoginState createState() => _LoaderLoginState();
}

class _LoaderLoginState extends State<LoaderLogin> {
  Map fetchedData;
  dynamic temporaryData;
  Future<void> fetchingData() async
  {
    await Future.delayed(Duration(seconds: 1),() async{
		  try
      {
        print("Fetched mapped data is $fetchedData"); // debug
        print("Trying to login with these data..."); // debug
        temporaryData = await Authenticator().login(fetchedData["email"],fetchedData["password"]);
        print("Temporary data: $temporaryData"); // debug   
        if(temporaryData!=null&&temporaryData!="Failed!")
        {
          Navigator.pushReplacementNamed(context, "home.dart");
        }
        else
        {
          Navigator.pushReplacementNamed(context, "login.dart");
        }
      }
      catch(e)
      {
        print("An error occured! Details: \n$e"); // debug
      }
		});
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