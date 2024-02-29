import 'package:rest_api_calling_flutter/models/users_details.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_calling_flutter/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Users> users = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

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
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];

            final image = user.pictures.thumbnail;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.email),
              trailing: Text(user.gender),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(image),
              ),
            );
          }),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
