import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:hotline_v2/src/models/PersonalInfo.dart';
import 'package:hotline_v2/src/views/ui/forms/medicalinfo.dart';
import 'package:hotline_v2/src/views/utils/FormHelper.dart';

import '../../../models/services/personal_info/PersonalInfoRepository.dart';

void main() => runApp(const PersonalForm());

// Create a Form widget.
class PersonalForm extends StatefulWidget {
  const PersonalForm({Key? key}) : super(key: key);

  @override
  PersonalFormState createState() {
    return PersonalFormState();
  }
}

class PersonalFormState extends State<PersonalForm> {
  final _formKey = GlobalKey<FormState>();
  final FormHelpers _formHelpers = FormHelpers();
  String _radioValue = '';

  void _handleRadioValueChange(String? value) {
    setState(() {
      _radioValue = value ?? '';
    });
  }

  final _ageController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _residenceController = TextEditingController();
  final _genderController = TextEditingController();
  final _occupationController = TextEditingController();
  final _guardianController = TextEditingController();
  final _guardianNumberController = TextEditingController();
  final _numberController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _idNumberController = TextEditingController();

  late FocusNode _nameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _dobFocusNode;
  late FocusNode _ageFocusNode;
  late FocusNode _residenceFocusNode;
  late FocusNode _genderFocusNode;
  late FocusNode _occupationFocusNode;
  late FocusNode _guardianFocusNode;
  late FocusNode _guardianNumberFocusNode;
  late FocusNode _numberFocusNode;
  late FocusNode _nationalityFocusNode;
  late FocusNode _idNumberFocusNode;

  @override
  void initState() {
    super.initState();

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _dobFocusNode = FocusNode();
    _ageFocusNode = FocusNode();
    _residenceFocusNode = FocusNode();
    _genderFocusNode = FocusNode();
    _occupationFocusNode = FocusNode();
    _guardianFocusNode = FocusNode();
    _guardianNumberFocusNode = FocusNode();
    _numberFocusNode = FocusNode();
    _nationalityFocusNode = FocusNode();
    _idNumberFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _ageController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    _residenceController.dispose();
    _genderController.dispose();
    _guardianController.dispose();
    _guardianNumberController.dispose();
    _numberController.dispose();
    _nationalityController.dispose();
    _idNumberController.dispose();
    _occupationController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _ageFocusNode.dispose();
    _dobFocusNode.dispose();
    _residenceFocusNode.dispose();
    _genderFocusNode.dispose();
    _guardianFocusNode.dispose();
    _guardianNumberFocusNode.dispose();
    _numberFocusNode.dispose();
    _nationalityFocusNode.dispose();
    _idNumberFocusNode.dispose();
    _occupationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HotLine',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('HotLine'),
            ),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'name',
                          hintText: 'John Doe',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
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
                            _formHelpers.validateField("name", value, null)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'email',
                          hintText: 'email@domain.com',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) => _formHelpers.validateField(
                            "name",
                            value,
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _ageController,
                      focusNode: _ageFocusNode,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'age',
                        hintText: '18',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Icon(
                          Icons.numbers_outlined,
                          color: Colors.red,
                        ),
                      ),
                      validator: (value) =>
                          _formHelpers.validateField("Age", value, r"^[0-9]"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                        validator: (val) => _formHelpers.validateField(
                            "Date of Birth", val, null)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _idNumberController,
                        focusNode: _idNumberFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'GhanaCard Number',
                          hintText: 'GHA-XXXXXXXXX-X',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
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
                        validator: (value) => _formHelpers.validateField(
                            "Ghana card", value, r"^[0-9]{10}[a-zA-Z]{3}")),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _nationalityController,
                        focusNode: _nationalityFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Nationality",
                          hintText: 'eg. Ghanaian',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
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
                        validator: (value) => _formHelpers.validateField(
                            "Nationality", value, null)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _numberController,
                      focusNode: _numberFocusNode,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Mobile number",
                        hintText: '0200000000',
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
                      validator: (value) => _formHelpers.validateField(
                          "Mobile Number",
                          value,
                          r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _occupationController,
                        focusNode: _occupationFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Place of Residence',
                          hintText: 'Where you stay and house no.',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.work_outline,
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) => _formHelpers.validateField(
                            "Occupation", value, null)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Male',
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                              ),
                              const Text('Male'),
                              Radio<String>(
                                value: 'Female',
                                groupValue: _radioValue,
                                onChanged: _handleRadioValueChange,
                              ),
                              const Text('Female'),
                            ],
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _residenceController,
                        focusNode: _residenceFocusNode,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Place of Residence',
                          hintText: 'Where you stay and house no.',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(
                            Icons.home_outlined,
                            color: Colors.red,
                          ),
                        ),
                        validator: (value) => _formHelpers.validateField(
                            "Place of Residence", value, null)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _guardianController,
                      focusNode: _guardianFocusNode,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Guardian's name",
                        hintText: 'John Doe',
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
                        suffixIcon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                      validator: (value) => _formHelpers.validateField(
                          "Guardian's Name", value, null),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _guardianNumberController,
                      focusNode: _guardianNumberFocusNode,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Guardian's number",
                        hintText: '0200000000',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.red,
                        ),
                      ),
                      validator: (value) => _formHelpers.validateField(
                          "Mobile Number",
                          value,
                          r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // Saving form data
                          PersonalInfoRepository personalInfoRepository =
                              PersonalInfoRepository();
                          PersonalInfo personalInfo = PersonalInfo()
                            ..name = _nameController.text
                            ..email = _emailController.text
                            ..age = _ageController.text as int
                            ..phoneNumber = _numberController.text
                            ..dateOfBirth = _dobController.text as DateTime
                            ..cardNumber = _idNumberController.text
                            ..nationality = _nationalityController.text
                            ..location = _residenceController.text
                            ..gender = _genderController.text
                            ..occupation = _occupationController.text;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                content: Text("Congratulations!!!"
                                    "Your Personal Information has been saved"),
                              );
                            },
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MedicalForm()),
                          );
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      // child: Text(' Elevated Button'))),
                      // tooltip: 'Show me the value!',

                      // },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            )));
  }
}
