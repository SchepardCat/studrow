import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:studrow/domain/model/card_model.dart';
import 'package:studrow/presentation/widgets/card/study_back_card.dart';
import 'package:studrow/presentation/widgets/card/study_front_card.dart';


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
