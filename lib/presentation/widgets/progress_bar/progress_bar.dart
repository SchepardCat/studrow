import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  final int currentNumber;
  final int totalCards;
  final double widthBar;
  const ProgressBar({ required this.totalCards, required this.currentNumber, required this.widthBar});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                child: LinearPercentIndicator(
                  width: widget.widthBar,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 1200,
                  percent: widget.currentNumber/widget.totalCards,
                  center: Text("" + widget.currentNumber.toString() + "/" + widget.totalCards.toString()),
                  barRadius: Radius.circular(8),
                  progressColor: Theme.of(context).colorScheme.primary,
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
