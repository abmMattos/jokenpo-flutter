import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  final int userScore;
  final int botScore;

  const ScoreBoard({
    required this.userScore,
    required this.botScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.green,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'USER\n\n${userScore}',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'BOT\n\n${botScore}',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
