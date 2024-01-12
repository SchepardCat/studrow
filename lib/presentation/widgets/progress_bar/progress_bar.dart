import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StudyProgressBar extends StatefulWidget {
  static const int totalSteps = 100;
  final int numberCurrentCard;
  final int numberOfCards;
  const StudyProgressBar({ required this.numberOfCards, required this.numberCurrentCard});

  @override
  State<StudyProgressBar> createState() => _StudyProgressBarState();
}

class _StudyProgressBarState extends State<StudyProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                child: StepProgressIndicator(
                  totalSteps: StudyProgressBar.totalSteps,
                  currentStep: widget.numberCurrentCard * (StudyProgressBar.totalSteps/widget.numberOfCards).toInt(),
                  size: 18,
                  padding: 0,
                  selectedColor: Colors.black,
                  unselectedColor: Colors.white,
                  roundedEdges: Radius.circular(8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
