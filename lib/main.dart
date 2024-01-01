import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF163020),
        appBar: AppBar(
          leading: Image.asset('images/dice.png'),
          elevation: 4,
          shadowColor: Colors.black,
          backgroundColor: const Color(0xFF163020),
          title: const Center(
            child: Text(
              'DICEE',
              style: TextStyle(
                color: Color(0xFFEEF0E5),
                fontFamily: 'SourceSans3',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const DicePage(),
      ),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 5;


  final player = AudioPlayer();

  void changeDiceFace() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
    player.play(AssetSource('diceRoll.mp3'));

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNum.png')),
          ),
          Expanded(
            child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rightDiceNum.png')),
          ),
        ],
      ),
    );
  }
}
