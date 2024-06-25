import 'package:flutter/material.dart';
import 'package:userprofile/screens/profile/create_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateProfile(),
    );
  }
}