import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.time});
  final int time;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.purple[900]),
        child: Text(time.toString().padLeft(2, "0"),
            style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600)));
  }
}
