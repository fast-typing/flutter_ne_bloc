import 'package:flutter/material.dart';

class TypingPage extends StatefulWidget {
  const TypingPage({Key? key}) : super(key: key);

  @override
  State<TypingPage> createState() => _TypingPage();
}

class _TypingPage extends State<TypingPage> {
  int _points = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бургер кликер'),
      ),
      body: (
        Column(
          children: [
            Positioned(
                right: 40,
                top: 40,
                child: Text('Кол-во очков: $_points}')
            )
          ],
        )
      ),
    );
  }
}
