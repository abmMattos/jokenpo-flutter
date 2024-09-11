import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_flutter/components/bot_choice_display.dart';
import 'package:project_flutter/components/choice_button.dart';
import 'package:project_flutter/components/score_board.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> randChosen = ['Pedra', 'Papel', 'Tesoura'];
  List<String> objectImages = [
    'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-pedra.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTPrOal_vl1zWqqmynV-eQh2gsJMvnrQsLS2X1umBCAIoJ8jn-XDPG_cjT54Bb7CZfUco&usqp=CAU',
    'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-tesoura.png'
  ];
  String userChosen = '';
  String botChosen = '';
  String chosenObjectImage = '';
  String matchResult = '';
  int userScore = 0; 
  int botScore = 0; 

  void _playGame(String choice) {
    setState(() {
      userChosen = choice;
      int rand = Random().nextInt(3);
      botChosen = randChosen[rand];
      chosenObjectImage = objectImages[rand];

      if (userChosen == '') {
        botChosen = '';
        chosenObjectImage = '';
        matchResult = '';
        return;
      }

      if (botChosen == userChosen) {
        matchResult = 'EMPATE!';
      } else if ((botChosen == 'Pedra' && userChosen == 'Papel') ||
                 (botChosen == 'Papel' && userChosen == 'Tesoura') ||
                 (botChosen == 'Tesoura' && userChosen == 'Pedra')) {
        matchResult = 'Você ganhou!';
        userScore++;
      } else {
        matchResult = 'Bot ganhou!';
        botScore++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOKENPO'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceButton(
                imageUrl: 'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-pedra.png',
                choice: 'Pedra',
                onTap: () => _playGame('Pedra'),
              ),
              ChoiceButton(
                imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTPrOal_vl1zWqqmynV-eQh2gsJMvnrQsLS2X1umBCAIoJ8jn-XDPG_cjT54Bb7CZfUco&usqp=CAU',
                choice: 'Papel',
                onTap: () => _playGame('Papel'),
              ),
              ChoiceButton(
                imageUrl: 'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-tesoura.png',
                choice: 'Tesoura',
                onTap: () => _playGame('Tesoura'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Escolha uma opção acima',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: BotChoiceDisplay(
              chosenObjectImage: chosenObjectImage,
              botChosen: botChosen,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              matchResult,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ScoreBoard(
            userScore: userScore,
            botScore: botScore,
          ),
        ],
      ),
    );
  }
}
