import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
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
      floatingActionButton:
          ElevatedButton(onPressed: fetchUsers, child: Text('Fetch')),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user["email"];
            final name =
                '${user["name"]["title"]} ${user["name"]["first"]} ${user["name"]["last"]}';

            final imageUrl = user["picture"]["thumbnail"];
            return ListTile(
              title: Text(name.toString()),
              subtitle: Text(email),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imageUrl),
              ),
            );
          }),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}
