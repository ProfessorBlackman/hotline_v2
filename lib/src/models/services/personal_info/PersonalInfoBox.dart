import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/PersonalInfo.dart';

class PersonalInfoBox {
  static const String _boxName = 'personal_info';

  Future<Box<PersonalInfo>> getBox() async {
    return await Hive.openBox<PersonalInfo>(_boxName);
  }

  void closeHive() async {
    await Hive.box<PersonalInfo>('personal_info').close();
    await Hive.close();
  }
}
