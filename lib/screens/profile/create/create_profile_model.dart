import 'dart:io';

class CreateProfileModel{
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? gender;
  DateTime? dob;
  File? image;
  CreateProfileModel(
  {
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.gender,
    this.dob,
    this.image
}
      );
}