import 'package:flutter/material.dart';
import 'package:nostee_brew_crew/pages/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:nostee_brew_crew/models/user.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final dynamic user = Provider.of<User>(context);
    print(user);
    // return either authenticate or home.
    return Authenticate();
  }
}