import 'package:flutter/material.dart';

class barrier extends StatelessWidget {

  final size;

  barrier ({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}
