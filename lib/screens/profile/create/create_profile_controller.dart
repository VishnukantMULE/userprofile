// profile_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'create_profile_model.dart';
import 'create_profile_view.dart';
import 'package:userprofile/screens/profile/user_profile.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  final CreateProfileModel _profileModel = CreateProfileModel();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileModel.image = File(pickedFile.path);
      });
    }
  }

  void _pickDate() async {
    DateTime? datepicker = await showDatePicker(
      context: context,
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2024, 12, 31),
      initialDate: DateTime.now(),
    );
    if (datepicker != null) {
      setState(() {
        _profileModel.dob = datepicker;
        _birthDateController.text = "${datepicker.year}-${datepicker.month}-${datepicker.day}";
      });
    }
  }

  void _onGenderChange(String? newValue) {
    setState(() {
      _profileModel.gender = newValue;
    });
  }

  void _onSubmit() {
    _profileModel.firstname = _firstNameController.text;
    _profileModel.lastname = _lastNameController.text;
    _profileModel.phonenumber = _phoneController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfile(
          firstname: _profileModel.firstname ?? '',
          lastname: _profileModel.lastname ?? '',
          phonenumber: _profileModel.phonenumber ?? '',
          birthdate: _profileModel.dob != null
              ? "${_profileModel.dob!.year}-${_profileModel.dob!.month}-${_profileModel.dob!.day}"
              : '',
          gender: _profileModel.gender ?? '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileView(
      firstNameController: _firstNameController,
      lastNameController: _lastNameController,
      birthDateController: _birthDateController,
      phoneController: _phoneController,
      selectedGender: _profileModel.gender,
      selectedDate: _profileModel.dob,
      image: _profileModel.image,
      onImagePick: _pickImage,
      onDatePick: _pickDate,
      onSubmit: _onSubmit,
      onGenderChange: _onGenderChange,
    );
  }
}
