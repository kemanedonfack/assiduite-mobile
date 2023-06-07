import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String result;

  Result({Key? key, required this.result}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.result)),
    );
  }
}
