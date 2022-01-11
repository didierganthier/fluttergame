// ignore_for_file: use_key_in_widget_constructors

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
