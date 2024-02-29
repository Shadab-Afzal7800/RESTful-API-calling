import 'package:rest_api_calling_flutter/models/user_image.dart';
import 'package:rest_api_calling_flutter/models/user_name.dart';

class Users {
  final String gender;
  final String email;
  final String phone;
  final UserName name;
  final UserImage pictures;

  Users({
    required this.gender,
    required this.email,
    required this.phone,
    required this.name,
    required this.pictures,
  });
  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
