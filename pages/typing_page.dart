import 'dart:math';
import 'package:flutter/material.dart';

class TypingPage extends StatefulWidget {
  const TypingPage({Key? key}) : super(key: key);

  @override
  State<TypingPage> createState() => _TypingPage();
}

class _TypingPage extends State<TypingPage> {
  int _points = 0;
  int _level = 1;
  int _price = 5;
  int _maxPoint = 50;
  bool _isPlay = true;
  String _userWord = '';
  String _curWord = '';
  List<String> _curWordArr = [];
  String letters = 'qwertyuiopasdfghjkzxcvbnmQWERTYUOPASDFGHJKLZXCVBNM1234567890';
  TextEditingController  _controller = TextEditingController();

  void CreateWord() {
    for (int i = 0; i < Random().nextInt(5)+3; i++)  {
      _curWordArr.add(letters[Random().nextInt(letters.length)]);
    }
    setState(() {
      _curWord = _curWordArr.join();
    });
    _curWordArr = [];
  }

  @override
  void initState() {
    super.initState();
    CreateWord();
  }

  @override
  Widget build(BuildContext context) {
    _isPlay = _points <= _maxPoint ;

    return Scaffold(
        appBar: AppBar(
        title: Text('Рандомные слова'),
      ),
      body: (
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_points >= _maxPoint)
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                child: Text('Поздравляю вы победили!!', style: TextStyle(fontSize: 30, color: Colors.redAccent)),
              ),
            Text('Очков за слово: $_level', style: TextStyle(fontSize: 20)),
            Padding(
              padding: EdgeInsets.all(3),
              child: Text('Кол-во очков: $_points', style: TextStyle(fontSize: 35)),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  ElevatedButton(
                      onPressed: () {
                        if (_points >= _price) {
                          setState(() {
                            _points -= _price;
                            _price += 5;
                            _level += 1;
                          });
                        }
                      },
                      child: Icon(Icons.upgrade),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Text('Стоимость улучшения: $_price', style: TextStyle(fontSize: 20)),
                ],
              ),
            if (_points < _maxPoint)
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Слово: $_curWord', style: TextStyle(fontSize: 30),),
              ),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
                child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                        hintText: 'Ведите показанное слово',
                        border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      _userWord = value;
                      if (_userWord == _curWord) {
                        setState(() {
                          _points += _level;
                        });
                        _controller.clear();
                        CreateWord();
                      }
                    },
                    enabled: _isPlay,
                ),
            ),
          ],
        )
      ),
    );
  }
}
