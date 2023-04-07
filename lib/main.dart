import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BallPage(),
    );
  }
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Ask Me Anything')),
        backgroundColor: Colors.blueAccent[300],
        centerTitle: true,
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  State<Ball> createState() => _BallState();
}

int ballImage = 1;

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    ballNumber();
                  });
                  print('The ball number is: $ballImage');
                },
                child: Image.asset('images/ball$ballImage.png')),
                Color: colors
          )),
    );
  }
}

void ballNumber() {
  ballImage = Random().nextInt(5) + 1;
}