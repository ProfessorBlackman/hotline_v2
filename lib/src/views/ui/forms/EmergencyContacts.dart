import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hotline_v2/src/models/EmergencyContacts.dart';
import 'package:hotline_v2/src/models/services/emergency_contacts/EmergencyContactsRepository.dart';
import 'package:hotline_v2/src/views/ui/home.dart';
import 'package:hotline_v2/src/views/utils/FormHelper.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({Key? key}) : super(key: key);

  @override
  EmergencyFormState createState() {
    return EmergencyFormState();
  }
}

class EmergencyFormState extends State<EmergencyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _dobController = TextEditingController();
  final _cardController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _numberController = TextEditingController();
  final _relationController = TextEditingController();

  late FocusNode _nameFocusNode;
  late FocusNode _ageFocusNode;
  late FocusNode _dobFocusNode;
  late FocusNode _cardFocusNode;
  late FocusNode _nationalityFocusNode;
  late FocusNode _numberFocusNode;
  late FocusNode _relationFocusNode;

  @override
  void initState() {
    super.initState();
    _nameFocusNode = FocusNode();
    _ageFocusNode = FocusNode();
    _dobFocusNode = FocusNode();
    _cardFocusNode = FocusNode();
    _nationalityFocusNode = FocusNode();
    _numberFocusNode = FocusNode();
    _relationFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _dobController.dispose();
    _cardController.dispose();
    _nationalityController.dispose();
    _numberController.dispose();
    _relationController.dispose();
    _nameFocusNode.dispose();
    _ageFocusNode.dispose();
    _dobFocusNode.dispose();
    _cardFocusNode.dispose();
    _nationalityFocusNode.dispose();
    _numberFocusNode.dispose();
    _relationFocusNode.dispose();
    super.dispose();
  }

  FormHelpers formHelpers = FormHelpers();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      EmergencyContactsRepository emergencyContactsRepository =
          EmergencyContactsRepository();
      EmergencyContacts emergencyContacts = EmergencyContacts()
        ..name = _nameController.text
        ..age = _ageController.text as int
        ..dateOfBirth = _dobController.text as DateTime
        ..cardNumber = _cardController.text
        ..nationality = _nationalityController.text
        ..phoneNumber = _numberController.text
        ..relation = _relationController.text;

      emergencyContacts.validate();
      emergencyContacts.sanitize();

      emergencyContactsRepository.addEmergencyContacts(emergencyContacts);

      // Show a success message.
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content:
                Text("Congratulations!!! Your Emergency Info has been saved"),
          );
        },
      );

      // Navigate to the next screen after submission (you can change this as needed).
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home(title: "HotLine")),
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
                controller: _nameController,
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'name',
                  hintText: 'Kojo Ntim',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.red,
                  ),
                ),
                validator: (value) =>
                    formHelpers.validateField("Name", value, null)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _ageController,
                focusNode: _ageFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Age',
                  hintText: "46",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.red,
                  ),
                ),
                validator: (value) =>
                    formHelpers.validateField("Age", value, null)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DateTimePicker(
                controller: _dobController,
                focusNode: _dobFocusNode,
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                // initialValue: DateTime.now().toString(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2023),
                icon: const Icon(
                  Icons.event,
                  color: Colors.red,
                ),
                dateLabelText: 'Date Of Birth',
                validator: (value) =>
                    formHelpers.validateField("Date of Birth", value, null)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _cardController,
                focusNode: _cardFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'GhanaCard Number',
                  hintText: 'GHA-XXXXXXXXX-X',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField(
                    "Ghana Card", value, r"^[0-9]{10}[a-zA-Z]{3}")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _nationalityController,
                focusNode: _nationalityFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Nationality",
                  hintText: "Ghanaian",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.account_box_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) =>
                    formHelpers.validateField("Nationality", value, null)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _numberController,
                focusNode: _numberFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Phone Number",
                  hintText: "0200000000",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField("Phone Number",
                    value, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
                controller: _relationController,
                focusNode: _relationFocusNode,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText:
                      "How is He/She related to you",
                  hintText:
                      "Uncle, Father, Aunt",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(
                    Icons.face,
                    color: Colors.red,
                  ),
                ),
                validator: (value) => formHelpers.validateField(
                    "Relation", value, null)),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Home(title: "HotLine")),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'Skip For Now',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
