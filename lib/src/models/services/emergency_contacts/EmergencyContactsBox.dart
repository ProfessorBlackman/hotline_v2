import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/EmergencyContacts.dart';


class EmergencyContactsBox{
  static const String _boxName = 'emergency_contacts';

  Future<Box<EmergencyContacts>> getBox() async {
    return await Hive.openBox<EmergencyContacts>(_boxName);
  }


  void closeHive() async {
    await Hive.box<EmergencyContacts>(_boxName).close();
    await Hive.close();
  }
}
