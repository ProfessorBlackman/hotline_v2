import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';

part 'adapters/UserAccount.g.dart';

@HiveType(typeId: 0)
class UserAccount extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String password;

  void validate() {
    if (name.isEmpty) {
      throw Exception('Name cannot be empty');
    }
    if (email.isEmpty) {
      throw Exception('Email cannot be empty');
    }
    if (password.isEmpty){
      throw Exception('Password cannot be empty');
    }
  }

  void sanitize() {
    name = name.trim();
    email = email.trim();
    password = _encryptPassword(password.trim());
  }

  String _encryptPassword(String password){
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  bool verifyPassword(String password, String hashedPassword) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    final hash = digest.toString();
    return hash == hashedPassword;
  }
}