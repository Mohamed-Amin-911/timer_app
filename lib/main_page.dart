import "dart:async";
import 'package:flutter/material.dart';
import 'package:timer_app/counter.dart';

class Timeree extends StatefulWidget {
  const Timeree({super.key});

  @override
  State<Timeree> createState() => _TimereeState();
}

class _TimereeState extends State<Timeree> {
  int sec = 0;
  int min = 0;
  int hour = 0;
  Timer? repeatedFunction;
  timere() {
    repeatedFunction = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        sec++;
        if (sec == 60) {
          min += 1;
          sec = 0;
        }
        if ((min % 60 == 0) && (min != 0)) {
          hour += 1;
          min = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Text(
          "Timer",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Counter(time: hour),
                const SizedBox(width: 10),
                Counter(time: min),
                const SizedBox(width: 10),
                Counter(time: sec)
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sec = 0;
                        min = 0;
                        hour = 0;
                      });
                      timere();
                    },
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(134, 105, 27, 154)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22)))),
                    child: const Text(
                      "start",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    repeatedFunction!.cancel();
                  },
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple[800]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)))),
                  child: const Text(
                    "stop",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
