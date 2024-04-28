import 'package:flutter/material.dart';
import '../../../../../domain/model/card_model.dart';

class StudyFrontCard extends StatelessWidget {
  final CardModel cardData;
  const StudyFrontCard({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Card(
            elevation: 20,
            // shadowColor: Colors.black,
            // color: Colors.black,
            child: SizedBox(
              width: 320,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardData.number.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        Text(
                          cardData.topic,
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      cardData.word,
                      maxLines: 3,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      maxLines: 3,
                      cardData.example,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ),
        ),
    );
  }


}
