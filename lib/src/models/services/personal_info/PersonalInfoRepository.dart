import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/PersonalInfo.dart';
import 'package:hotline_v2/src/models/services/personal_info/PersonalInfoBox.dart';


class PersonalInfoRepository {
  static final PersonalInfoBox _personalInfoBox = PersonalInfoBox();

  Future<void> addPersonalInfo(PersonalInfo user) async {
    final box = await _personalInfoBox.getBox();
    await box.add(user);
  }

  Future<List<PersonalInfo>> getAll() async {
    final box = await _personalInfoBox.getBox();
    return box.values.toList();
  }

  Future<void> updatePersonalInfo(PersonalInfo user) async {
    final box = await _personalInfoBox.getBox();
    final index = box.values.toList().indexWhere((x) => x.key == user.key);
    await box.putAt(index, user);
  }

  Future<void> deletePersonalInfo(PersonalInfo user) async {
    final box = await _personalInfoBox.getBox();
    await box.delete(user.key);
  }

  Future<String> get(String item) async {
    final box = await _personalInfoBox.getBox();
    final users = box.values.toList();
    switch(item){
      case 'name':
        return users.map((user) => user.name).toString();
      case 'age':
        return users.map((user) => user.age).toString();
      case 'email':
        return users.map((user) => user.email).toString();
      case 'phoneNumber':
        return users.map((user) => user.phoneNumber).toString();
      case 'dateOfBirth':
        return users.map((user) => user.dateOfBirth).toString();
      case 'cardNumber':
        return users.map((user) => user.cardNumber).toString();
      case 'nationality':
        return users.map((user) => user.nationality).toString();
      case 'location':
        return users.map((user) => user.location).toString();
      case 'gender':
        return users.map((user) => user.gender).toString();
      default:
        return 'null';
    }
  }
}
