import 'package:hive/hive.dart';

part 'adapters/PersonalInfo.g.dart';

@HiveType(typeId: 0)
class PersonalInfo extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String phoneNumber;

  @HiveField(4)
  late DateTime dateOfBirth;

  @HiveField(5)
  late String cardNumber;

  @HiveField(6)
  late String nationality;

  @HiveField(7)
  late String location;

  @HiveField(8)
  late String gender;

  @HiveField(9)
  late String occupation;

  bool get isAdult => age >= 18;

  void validate() {
    if (name.isEmpty) {
      throw Exception('Name cannot be empty');
    }
    if (email.isEmpty) {
      throw Exception('Email cannot be empty');
    }
    if (phoneNumber.isEmpty) {
      throw Exception('Phone number cannot be empty');
    }
    if (cardNumber.isEmpty) {
      throw Exception('Card number cannot be empty');
    }
    if (nationality.isEmpty) {
      throw Exception('Nationality cannot be empty');
    }
    if (location.isEmpty) {
      throw Exception('Location cannot be empty');
    }
    if (gender.isEmpty) {
      throw Exception('Gender cannot be empty');
    }
    if (occupation.isEmpty) {
      throw Exception('Occupation cannot be empty');
    }
  }

  void sanitize() {
    name = name.trim();
    email = email.trim();
    phoneNumber = phoneNumber.trim();
    cardNumber = cardNumber.trim();
    nationality = nationality.trim();
    location = location.trim();
    gender = gender.trim();
    occupation = occupation.trim();
  }
}