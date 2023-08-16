import 'package:hive/hive.dart';

part 'adapters/MedicalInfo.g.dart';

@HiveType(typeId: 0)
class MedicalInfo extends HiveObject {
  @HiveField(0)
  late String nhis;

  @HiveField(1)
  late String disabilities;

  @HiveField(2)
  late String disorders;

  @HiveField(3)
  late String allergies;

  @HiveField(4)
  late String chronicConditions;

  @HiveField(5)
  late String previousSurgeriesAndHospitalizations;

  @HiveField(6)
  late String immunizationHistory;

  @HiveField(7)
  late String lifestyleAndHabits;

  @HiveField(8)
  late String insurance;

  void validate() {
    if (nhis.isEmpty) {
      throw Exception('Nhis cannot be empty');
    }
    if (disabilities.isEmpty) {
      throw Exception('Disabilities cannot be empty');
    }
    if (disorders.isEmpty) {
      throw Exception('Disorders cannot be empty');
    }
    if (allergies.isEmpty) {
      throw Exception('Allergies cannot be empty');
    }
    if (chronicConditions.isEmpty) {
      throw Exception('ChronicConditions cannot be empty');
    }
    if (previousSurgeriesAndHospitalizations.isEmpty) {
      throw Exception('PreviousSurgeries cannot be empty');
    }
    if (immunizationHistory.isEmpty) {
      throw Exception('Immunization History cannot be empty');
    }
    if (lifestyleAndHabits.isEmpty){
      throw Exception('LyfestyleAndHabits cannot be empty');
    }
    if (insurance.isEmpty){
      throw Exception('Insurance cannot be empty');
    }
  }

  void sanitize() {
    nhis = nhis.trim();
    disabilities = disabilities.trim();
    disorders = disorders.trim();
    allergies = allergies.trim();
    chronicConditions = chronicConditions.trim();
    previousSurgeriesAndHospitalizations= previousSurgeriesAndHospitalizations.trim();
    immunizationHistory = immunizationHistory.trim();
    lifestyleAndHabits = lifestyleAndHabits.trim();
    insurance = insurance.trim();
  }
}