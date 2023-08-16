import 'package:hotline_v2/src/models/EmergencyContacts.dart';
import 'package:hotline_v2/src/models/services/emergency_contacts/EmergencyContactsBox.dart';


class EmergencyContactsRepository {
  static final EmergencyContactsBox _emergencyContactsBox = EmergencyContactsBox();

  Future<void> addEmergencyContacts(EmergencyContacts emergencyContacts) async {
    final box = await _emergencyContactsBox.getBox();
    await box.add(emergencyContacts);
  }

  Future<List<EmergencyContacts>> getAll() async {
    final box = await _emergencyContactsBox.getBox();
    return box.values.toList();
  }

  Future<void> updateEmergencyContacts(EmergencyContacts emergencyContacts) async {
    final box = await _emergencyContactsBox.getBox();
    final index = box.values.toList().indexWhere((x) => x.key == emergencyContacts.key);
    await box.putAt(index, emergencyContacts);
  }

  Future<void> deleteEmergencyContacts(EmergencyContacts emergencyContacts) async {
    final box = await _emergencyContactsBox.getBox();
    await box.delete(emergencyContacts.key);
  }

  Future<String> get(String item) async {
    final box = await _emergencyContactsBox.getBox();
    final emergencyContacts = box.values.toList();
    switch(item){
      case 'name':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.name).toString();
      case 'age':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.age).toString();
      case 'email':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.email).toString();
      case 'phoneNumber':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.phoneNumber).toString();
      case 'dateOfBirth':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.dateOfBirth).toString();
      case 'cardNumber':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.cardNumber).toString();
      case 'nationality':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.nationality).toString();
      case 'location':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.location).toString();
      case 'gender':
        return emergencyContacts.map((emergencyContacts) => emergencyContacts.gender).toString();
      default:
        return 'null';
    }
  }
}
