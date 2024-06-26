import 'package:flutter/cupertino.dart';

class CustomSizebox extends StatelessWidget {
  final double height;
  const CustomSizebox({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
