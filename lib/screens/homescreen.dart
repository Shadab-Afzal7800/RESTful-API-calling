import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        title: Text(
          'Rest API Calling',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
      ),
    );
  }
}
