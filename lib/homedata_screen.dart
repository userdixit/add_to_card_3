import 'package:flutter/material.dart';

class HomeDataScreen extends StatefulWidget {
  const HomeDataScreen({Key? key}) : super(key: key);

  @override
  State<HomeDataScreen> createState() => _HomeDataScreenState();
}

class _HomeDataScreenState extends State<HomeDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
