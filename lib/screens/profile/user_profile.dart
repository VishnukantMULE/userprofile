import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userprofile/screens/profile/create/create_profile_controller.dart';

class UserProfile extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String birthdate;
  final String gender;

  const UserProfile({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.birthdate,
    required this.gender
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ProfileController()),
            );
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        title: const Text("User Profile"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://picsum.photos/200',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  ' ${widget.firstname} ${widget.lastname}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  height: 32,
                ),
              ],
            ),
          ),

          Container(height: 16),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Gender"),
            subtitle: Text(widget.gender),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text("Phone Number"),
            subtitle: Text(widget.phonenumber),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Date of Birth"),
            subtitle: Text(widget.birthdate),
          ),
        ],
      ),
    );
  }
}
