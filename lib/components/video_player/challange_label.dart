import 'package:flutter/material.dart';
import 'package:state_management/helper.dart';

class ChallengeLabel extends StatelessWidget {
  Challange challange;
  ChallengeLabel({required this.challange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexaColor('#FFFFFF', opacity: 20),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: challange.color,
              ),
              width: 8,
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 2),
              child: Text(
                challange.name,
                style: TextStyle(fontFamily: 'Titillium Web'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
