import 'package:flutter/material.dart';
import 'package:userprofile/screens/profile/create/create_profile_controller.dart';

void main() {
  // runApp(MyAPP());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CreateProfile(),
      home:  ProfileController(),
    );
  }
}
//
// class MyAPP extends StatefulWidget {
//   const MyAPP({super.key});
//
//   @override
//   State<MyAPP> createState() => _MyAPPState();
// }
//
// class _MyAPPState extends State<MyAPP> {
//   int x=10;
//   @override
//
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Learning"),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text(x.toString(),style: TextStyle(fontSize: 50),),
//
//             ),
//
//
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//
//           onPressed: ()
//           {
//             x++;
//             setState(() {
//
//             });
//             print("Button presses $x");
//
//           }
//           ,
//         ),
//       ),
//
//     );
//   }
// }
