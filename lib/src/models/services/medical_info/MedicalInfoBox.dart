import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/MedicalInfo.dart';

class MedicalInfoBox {
  static const String _boxName = 'medical_history';

  Future<Box<MedicalInfo>> getBox() async {
    return await Hive.openBox<MedicalInfo>(_boxName);
  }

  void closeHive() async {
    await Hive.box<MedicalInfo>('medical_history').close();
    await Hive.close();
  }
}
