import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CLIMA", style: TextStyle(letterSpacing: 5, fontSize: 20) ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}