import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/MedicalInfo.dart';
import 'package:hotline_v2/src/models/services/medical_info/MedicalInfoBox.dart';


class MedicalInfoRepository {
  static final MedicalInfoBox _medicalInfoBox = MedicalInfoBox();

  Future<void> addMedicalHistory(MedicalInfo medicalData) async {
    final box = await _medicalInfoBox.getBox();
    await box.add(medicalData);
  }

  Future<List<MedicalInfo>> getAll() async {
    final box = await _medicalInfoBox.getBox();
    return box.values.toList();
  }

  Future<void> updateMedicalHistory(MedicalInfo medicalData) async {
    final box = await _medicalInfoBox.getBox();
    final index = box.values.toList().indexWhere((x) => x.key == medicalData.key);
    await box.putAt(index, medicalData);
  }

  Future<void> deleteMedicalHistory(MedicalInfo medicalData) async {
    final box = await _medicalInfoBox.getBox();
    await box.delete(medicalData.key);
  }

  Future<String> get(String item) async {
    final box = await _medicalInfoBox.getBox();
    final medicalData = box.values.toList();
    switch (item){
      case 'nhis':
        return medicalData.map((medicalData) => medicalData.nhis).toString();
      case 'disabilities':
        return medicalData.map((medicalData) => medicalData.disabilities).toString();
      case 'disorders':
        return medicalData.map((medicalData) => medicalData.disorders).toString();
      case 'allergies':
        return medicalData.map((medicalData) => medicalData.allergies).toString();
      case 'chronicConditions':
        return medicalData.map((medicalData) => medicalData.chronicConditions).toString();
      case 'previousSurgeriesAndHospitalizations':
        return medicalData.map((medicalData) => medicalData.previousSurgeriesAndHospitalizations).toString();
      case 'immunizationHistory':
        return medicalData.map((medicalData) => medicalData.immunizationHistory).toString();
      case 'lifestyleAndHabits':
        return medicalData.map((medicalData) => medicalData.lifestyleAndHabits).toString();
      case 'insurance':
        return medicalData.map((medicalData) => medicalData.insurance).toString();
      default:
        return 'null';
    }


  }
}
