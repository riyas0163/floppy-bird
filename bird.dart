import 'package:flutter/material.dart';

class mybird extends StatefulWidget {
  const mybird({super.key});

  @override
  State<mybird> createState() => _mybirdState();
}

class _mybirdState extends State<mybird> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/flybird.jpg"),
          )
      ),

    );
  }
}
