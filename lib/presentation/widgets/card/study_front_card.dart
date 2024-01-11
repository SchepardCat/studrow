import 'package:flutter/material.dart';


import '../../../domain/model/card_model.dart';

class StudyFrontCard extends StatelessWidget {
  final CardModel cardData;
  const StudyFrontCard({required this.cardData, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: Card(
            shadowColor: Colors.black,
            color: Colors.black,
            child: SizedBox(
              width: 320,
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardData.number,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          cardData.topicEN,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            cardData.image,
                            style: TextStyle(
                              fontSize: 38,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          cardData.wordEN,
                           style: TextStyle(
                             fontSize: 30,
                             color: Colors.white,
                             fontWeight: FontWeight.w500,
                           ),
                        ),
                        Text(
                          cardData.sentenceEN,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
