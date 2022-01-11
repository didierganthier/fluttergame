// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _HomePageState extends State<HomePage> {
  //player variations
  double playerX = -0.2;
  double brickWidth = 0.4;
  int playerScore = 0;
// enemy variable
  double enemyX = -0.2;
  int enemyScore = 0;
//ball
  double ballx = 0;
  double bally = 0;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.RIGHT;
  bool gameStarted = false;

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 1), (timer) {
      updatedDirection();
      moveBall();
      moveEnemy();
      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _showDialog(false);
        // resetGame();
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _showDialog(true);
        // resetGame();
      }
    });
  }

  void updatedDirection() {
    setState(() {
      //update vertical dirction
      if (bally >= 0.9 && playerX + brickWidth >= ballx && playerX <= ballx) {
        ballYDirection = direction.UP;
      } else if (bally <= -0.9) {
        ballYDirection = direction.DOWN;
      }
      // update horizontal directions
      if (ballx >= 1) {
        ballXDirection = direction.LEFT;
      } else if (ballx <= -1) {
        ballXDirection = direction.RIGHT;
      }
    });
  }

  void moveBall() {
    //vertical movement
    setState(() {
      if (ballYDirection == direction.DOWN) {
        bally += 0.01;
      } else if (ballYDirection == direction.UP) {
        bally -= 0.01;
      }
    });
    //horizontal movement
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballx -= 0.01;
      } else if (ballXDirection == direction.RIGHT) {
        ballx += 0.01;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerX - 0.1 <= -1)) {
        playerX -= 0.1;
      }
    });
  }

  void moveRight() {
    if (!(playerX + brickWidth >= 1)) {
      playerX += 0.1;
    }
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      gameStarted = false;
      ballx = 0;
      bally = 0;
      playerX = -0.2;
      enemyX = -0.2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game On"),
      ),
      body: const Center(
        child: Text("Hello World"),
      ),
    );
  }
}
