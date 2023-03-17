import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Center(child: Text('Ask Me Anything')),
          backgroundColor: Colors.blueAccent[100],
          centerTitle: true,
        ),
        body: BallPage(),
      ),
    ),
  );
}

class BallPage extends StatefulWidget {
  @override
  State<BallPage> createState() => _BallPageState();
}

int ballImage = 1;

class _BallPageState extends State<BallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: TextButton(
                onPressed: () {
                  setState(() {
                    ballNumber();
                  });

                  print(ballImage);
                },
                child: Image.asset('images/ball$ballImage.png')),
          )),
    );
  }
}

void ballNumber() {
  ballImage = Random().nextInt(5) + 1;
}
