import 'package:flutter/material.dart';

const String tableUser = 'users';

class UserField {
  static final List<String> values = [
    // id,
    username,
    surname,
    email,
    password,
  ];
  // static const String id = '_id';
  static const username = 'username';
  static const surname = 'surname';
  static const email = 'email';
  static const password = 'password';
}

class User {
  // final int? id;
  final String username;
  final String surname;
  final String password;
  final String email;

  User({
    // this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.surname,
  });
  User copy({
    // int? id,
    String? username,
    String? surname,
    String? password,
    String? email,
  }) =>
      User(
        // id: id ?? this.id,
        username: username ?? this.username,
        surname: surname ?? this.surname,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  Map<String, Object> toJson() => {
        // UserField.id: id!,
        UserField.surname: surname,
        UserField.username: username,
        UserField.password: password,
        UserField.email: email
      };
  static User fromJson(Map<String, Object?> json) => User(
      // id: json[UserField.id] as int,
      username: json[UserField.username] as String,
      email: json[UserField.email] as String,
      password: json[UserField.password] as String,
      surname: json[UserField.surname] as String);
  @override
  String toString() {
    return 'User{id: id, username: $username, surname: $surname ,email: $email,password:$password}';
  }
}

String getCapitalize(String str) {
  String temp = str.characters.first.toUpperCase() + str.substring(1);
  return temp;
}
