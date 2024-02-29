import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_calling_flutter/models/user_image.dart';
import 'package:rest_api_calling_flutter/models/user_name.dart';
import 'package:rest_api_calling_flutter/models/users_details.dart';

class UserApi {
  static Future<List<Users>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      final name = UserName(
          title: e["name"]["title"],
          first: e["name"]["first"],
          last: e["name"]["last"]);
      final pictures = UserImage(
          large: e["picture"]['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']);
      return Users(
          email: e['email'],
          gender: e['gender'],
          phone: e['phone'],
          pictures: pictures,
          name: name);
    }).toList();
    return users;
  }
}
