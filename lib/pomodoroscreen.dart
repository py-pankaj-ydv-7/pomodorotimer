import 'package:flutter/material.dart';
import 'package:pomodorotimer/utils.dart';
import 'package:pomodorotimer/widgets/progresswidget.dart';
import 'package:pomodorotimer/widgets/timecontroller.dart';
import 'package:pomodorotimer/widgets/timeoptions.dart';
import 'package:pomodorotimer/widgets/timercard.dart';
import 'package:pomodorotimer/widgets/timerservice.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor: renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
          "POMOTIMER",
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            iconSize: 40,
            onPressed: () =>Provider.of<TimerService>(context, listen: false).reset())
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: const Column(children: [
            SizedBox(height: 15),
            TimerCard(),
            SizedBox(
              height: 40,
            ),
            TimerOptions(),
            SizedBox(
              height: 30,
            ),
            Timecontroller(),
            SizedBox(
              height: 30,
            ),
            ProgressWidget()
          ]),
        ),
      ),
    );
  }
}
