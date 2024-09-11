import 'package:flutter/material.dart';

class BotChoiceDisplay extends StatelessWidget {
  final String chosenObjectImage;
  final String botChosen;

  const BotChoiceDisplay({
    required this.chosenObjectImage,
    required this.botChosen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
          image: DecorationImage(
            image: NetworkImage(chosenObjectImage),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
