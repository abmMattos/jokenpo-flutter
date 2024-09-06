import 'dart:math';
import 'package:flutter/material.dart';

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
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      userChosen = 'Pedra';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-pedra.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      userChosen = 'Papel';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTPrOal_vl1zWqqmynV-eQh2gsJMvnrQsLS2X1umBCAIoJ8jn-XDPG_cjT54Bb7CZfUco&usqp=CAU'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      userChosen = 'Tesoura';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://wesraiuga.github.io/games/assets/img/jokenpo/jokenpo-user-tesoura.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  ),
                ),
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  int rand = Random().nextInt(3);
                  botChosen = randChosen[rand];
                  chosenObjectImage = objectImages[rand];
                  if (userChosen == '') {
                    botChosen = '';
                    chosenObjectImage = '';
                  }
                });
              },
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
                child: Center(
                  child: Text(
                    botChosen.isEmpty ? '' : botChosen,
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Clique no botão acima para selecionar a jogada do robô\n\nResultado:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              matchResult,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
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
          ),
        ],
      ),
    );
  }
}
