import 'package:flutter/material.dart';

// this is responsible for setting-up data for new users.
// NOTE: Called in home.dart

class SetupCharacter extends StatefulWidget {
  @override
  _SetupCharacterState createState() => _SetupCharacterState();
}

class _SetupCharacterState extends State<SetupCharacter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
        ),
      )
    );
  }
}