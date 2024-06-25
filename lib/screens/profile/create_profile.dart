import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:userprofile/screens/profile/user_profile.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  String? selectedGender;
  DateTime? selectedDate;

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _birthDateController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Center(
          child: Text("Create Profile"),
        ),
        actions: const [Icon(Icons.menu)],
      ),
      body: ListView(
        children: [
          ImagePickerWidget(),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  controller: firstnameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 10, color: Colors.black)),
                      hintText: 'Enter Your First Name'),
                ),
                Container(
                  height: 40,
                ),
                TextField(
                  controller: lastnameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 10, color: Colors.black)),
                      hintText: 'Enter Your Last Name'),
                ),
                Container(
                  height: 40,
                ),
                IntlPhoneField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 5))),
                ),
                Container(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedGender,
                      hint: Text(
                        'Select Gender',
                        style: TextStyle(fontSize: 17),
                      ),
                      items:
                          ['male', 'female', 'others'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    onPressed: () async {
                      DateTime? datepicker = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1950, 1, 1),
                        lastDate: DateTime(2024, 12, 31),
                        initialDate: DateTime.now(),
                      );
                      if (datepicker != null) {
                        setState(() {
                          selectedDate = datepicker;
                          _birthDateController.text =
                              "${datepicker.year}-${datepicker.month}-${datepicker.day}";
                        });
                        print('Selected date: $datepicker');
                      } else {
                        print('No date selected');
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedDate != null
                              ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                              : 'Enter Your Birth Date',
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(width: 150),
                        const Icon(Icons.date_range),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                ),
                Container(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      String firstName = firstnameController.text;
                      String lastName = lastnameController.text;
                      String phone = _phoneController.text;
                      String birthDate = selectedDate != null
                          ? "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}"
                          : '';
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile(
                                  firstname: firstName,
                                  lastname: lastName,
                                  phonenumber: phone,
                                  birthdate: birthDate,
                                gender:selectedGender.toString(),
                              )));
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 5),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: ClipOval(
                child: _image == null
                    ? Image.network(
                        'https://picsum.photos/200',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        _image!,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              onPressed: _pickImage,
              icon: const Icon(
                Icons.add_a_photo,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
