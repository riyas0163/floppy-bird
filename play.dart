import 'package:flutter/material.dart';

class play extends StatelessWidget {
  final size;

  play({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}
