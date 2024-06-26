// profile_view.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:userprofile/util/widgets/custom_sizebox.dart';
import 'package:userprofile/util/widgets/text_field.dart';
import 'create_profile_model.dart';

class ProfileView extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthDateController;
  final TextEditingController phoneController;
  final String? selectedGender;
  final DateTime? selectedDate;
  final File? image;
  final Function onImagePick;
  final Function onDatePick;
  final Function onSubmit;
  final Function onGenderChange;

  ProfileView({
    required this.firstNameController,
    required this.lastNameController,
    required this.birthDateController,
    required this.phoneController,
    required this.selectedGender,
    required this.selectedDate,
    required this.image,
    required this.onImagePick,
    required this.onDatePick,
    required this.onSubmit,
    required this.onGenderChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Center(child: Text("Create Profile")),
        actions: const [Icon(Icons.menu)],
      ),
      body: ListView(
        children: [
          Container(
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
                      child: image == null
                          ? Image.network(
                        'https://picsum.photos/200',
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      )
                          : Image.file(
                        image!,
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
                    onPressed: () => onImagePick(),
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                CustomTextField(
                  controller: firstNameController,
                  hinttext: 'Enter Your first Name',
                  bcolor: Colors.black,
                  bwidth: 2.0,
                  bradius: 8.0,
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: lastNameController,
                  hinttext: 'Enter Your Last Name',
                  bcolor: Colors.black,
                  bwidth: 2.0,
                  bradius: 8.0,
                ),
                const SizedBox(height: 40),
                IntlPhoneField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 5))),
                ),
                const CustomSizebox(
                  height: 30,
                ),                Container(
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
                      items: ['male', 'female', 'others'].map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? newValue) => onGenderChange(newValue),
                    ),
                  ),
                ),
                const CustomSizebox(
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
                    onPressed: () => onDatePick(),
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
                SizedBox(height: 40),
                Container(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => onSubmit(),
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
