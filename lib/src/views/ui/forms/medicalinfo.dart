import 'package:flutter/material.dart';
import 'package:hotline_v2/src/models/MedicalInfo.dart';
import 'package:hotline_v2/src/models/services/medical_info/MedicalRepository.dart';
import 'package:hotline_v2/src/views/ui/forms/EmergencyContacts.dart';
import 'package:hotline_v2/src/views/utils/FormHelper.dart';

class MedicalForm extends StatefulWidget {
  const MedicalForm({Key? key}) : super(key: key);

  @override
  MedicalFormState createState() {
    return MedicalFormState();
  }
}

class MedicalFormState extends State<MedicalForm> {
  final _formKey = GlobalKey<FormState>();
  final _disabilitiesController = TextEditingController();
  final _disordersController = TextEditingController();
  final _medicationsController = TextEditingController();
  final _nhisNumberController = TextEditingController();
  final _allergiesController = TextEditingController();
  final _chronicConditionsController = TextEditingController();
  final _previousHospitalizationsController = TextEditingController();
  final _immunizationHistoryController = TextEditingController();
  final _lifestyleAndHabitsController = TextEditingController();
  final _insuranceController = TextEditingController();

  late FocusNode _disabilityFocusNode;
  late FocusNode _disorderFocusNode;
  late FocusNode _medicationFocusNode;
  late FocusNode _nhisNumberFocusNode;
  late FocusNode _allergiesFocusNode;
  late FocusNode _chronicConditionsFocusNode;
  late FocusNode _previousHospitalizationsFocusNode;
  late FocusNode _immunizationHistoryFocusNode;
  late FocusNode _lifestyleAndHabitsFocusNode;
  late FocusNode _insuranceFocusNode;

  @override
  void initState() {
    super.initState();
    _disabilityFocusNode = FocusNode();
    _disorderFocusNode = FocusNode();
    _medicationFocusNode = FocusNode();
    _nhisNumberFocusNode = FocusNode();
    _allergiesFocusNode = FocusNode();
    _chronicConditionsFocusNode = FocusNode();
    _previousHospitalizationsFocusNode = FocusNode();
    _immunizationHistoryFocusNode = FocusNode();
    _lifestyleAndHabitsFocusNode = FocusNode();
    _insuranceFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _medicationsController.dispose();
    _disabilitiesController.dispose();
    _disordersController.dispose();
    _nhisNumberController.dispose();
    _allergiesController.dispose();
    _chronicConditionsController.dispose();
    _previousHospitalizationsController.dispose();
    _immunizationHistoryController.dispose();
    _lifestyleAndHabitsController.dispose();
    _insuranceController.dispose();
    _disorderFocusNode.dispose();
    _medicationFocusNode.dispose();
    _disabilityFocusNode.dispose();
    _allergiesFocusNode.dispose();
    _chronicConditionsFocusNode.dispose();
    _previousHospitalizationsFocusNode.dispose();
    _immunizationHistoryFocusNode.dispose();
    _lifestyleAndHabitsFocusNode.dispose();
    _insuranceFocusNode.dispose();
    super.dispose();
  }

  FormHelpers formHelpers = FormHelpers();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      MedicalInfoRepository medicalInfoRepository = MedicalInfoRepository();
      MedicalInfo medicalInfo = MedicalInfo()
      ..nhis = _nhisNumberController.text
      ..disabilities = _disabilitiesController.text
      ..disorders = _disordersController.text
      ..allergies = _allergiesController.text
      ..chronicConditions = _chronicConditionsController.text
      ..previousSurgeriesAndHospitalizations = _previousHospitalizationsController.text
      ..immunizationHistory = _immunizationHistoryController.text
      ..lifestyleAndHabits = _lifestyleAndHabitsController.text
      ..insurance = _insuranceController.text;
      medicalInfo.validate();
      medicalInfo.sanitize();

      medicalInfoRepository.addMedicalHistory(medicalInfo);


      // Show a success message.
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Congratulations!!! Your Medical Information has been saved"),
          );
        },
      );

      // Navigate to the next screen after submission (you can change this as needed).
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EmergencyForm()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _nhisNumberController,
              focusNode: _nhisNumberFocusNode,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'NHIS Number',
                hintText: 'XXXXXXXXX',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
              validator: (value) => formHelpers.validateField("NHIS number", value, r"^[0-9]")
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _disabilitiesController,
              focusNode: _disabilityFocusNode,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Disability',
                hintText: "eg. Blind, Deaf, Lame, etc or none if you don't have",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.wheelchair_pickup_outlined,
                  color: Colors.red,
                ),
              ),
              validator: (value) => formHelpers.validateField("Disabilities", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _disordersController,
              focusNode: _disorderFocusNode,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Any Disorders',
                hintText:
                "eg. Asthma, Sickle Cell, Bipolar etc or none if you don't have any",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.sick_outlined,
                  color: Colors.red,
                ),
              ),
              validator: (value) => formHelpers.validateField("Disorders", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _allergiesController,
              focusNode: _allergiesFocusNode,
              // keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Are you allergic to anything?',
                hintText: 'Pollen, dust, smoke, etc. Enter none if you don\'t have',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.coronavirus_outlined,
                  color: Colors.red,
                ),
              ),
              validator: (value) => formHelpers.validateField("Allergies", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: _medicationsController,
              focusNode: _medicationFocusNode,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Any Medication",
                hintText:
                "Write medication you've been taking or none if you don't take any",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.medication_outlined,
                  color: Colors.red,
                ),
              ),
              validator: (value) => formHelpers.validateField("Medications", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _chronicConditionsController,
                focusNode: _chronicConditionsFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Are you suffering from any chronic disease which hasn't been listed?",
                  hintText:
                  "Egs: Diabetes, Hypertension, Depression or none if you don't have any",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.sick,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Chronic Conditions", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _previousHospitalizationsController,
                focusNode: _previousHospitalizationsFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Have you had any surgeries or have you been hospitalized in the past",
                  hintText:
                  "Open heart surgery, plastic surgery, hospitalized from fatal car crash or none if no",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.local_hospital_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Hospitalization History", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _immunizationHistoryController,
                focusNode: _immunizationHistoryFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "What vaccinations have you received before",
                  hintText:
                  "Polio vaccine, covid vaccine, etc",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.vaccines_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Immunization History", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _lifestyleAndHabitsController,
                focusNode: _lifestyleAndHabitsFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Describe your lifestyle and habits",
                  hintText:
                  "Are you on any drugs not prescribed? Do you smoke or drink? How frequent is this habit?",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.smoking_rooms_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Lifestyle and habits", value, null)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _insuranceController,
                focusNode: _insuranceFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Any Medical insurance?",
                  hintText:
                  "Do you have any medical insurance aside NHIS",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.health_and_safety_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Insurance", value, null)
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const EmergencyForm()),
          //       );
          //     },
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          //     ),
          //     child: const Text(
          //       'Skip For Now',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
