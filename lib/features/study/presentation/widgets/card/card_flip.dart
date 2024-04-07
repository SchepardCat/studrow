import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


import '../../../domain/model/card_model.dart';
import 'study_back_card.dart';
import 'study_front_card.dart';


class CardFlip extends StatelessWidget {
  final CardModel cardData;
  const CardFlip({required this.cardData,super.key});

  @override
  Widget build(BuildContext context, ) {
    return FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        side: CardSide.FRONT,
        front: StudyFrontCard(cardData: cardData),
        back: StudyBackCard(cardData: cardData),
    );
  }
}
