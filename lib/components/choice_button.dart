import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String imageUrl;
  final String choice;
  final VoidCallback onTap;

  const ChoiceButton({
    required this.imageUrl,
    required this.choice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.contain,
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
      ),
    );
  }
}
