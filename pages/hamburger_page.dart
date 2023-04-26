import 'package:flutter/material.dart';

class HamburgerPage extends StatefulWidget {
  const HamburgerPage({Key? key}) : super(key: key);

  @override
  State<HamburgerPage> createState() => _HamburgerPageState();
}

class _HamburgerPageState extends State<HamburgerPage> {
  int _bytes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Бургер кликер'),
      ),
      body:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Image(image: ResizeImage(AssetImage('assets/burger.png'), width: 400)),
                  Text('Это ооочень вкусный бургер.', style: TextStyle(fontSize: 25)),
                  Text('Кол-во укусов: $_bytes', style: TextStyle(fontSize: 40)),
                  _bytes >= 20 ? Text('УРАААА! Ты наелся', style: TextStyle(fontSize: 30)) : Text('Сьешь его!!', style: TextStyle(fontSize: 30)),
              ],
            ),)

          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _bytes >= 20 ? _bytes : _bytes++;
            });
          },
          child: Icon(Icons.add_rounded),
        ),
    );
  }
}
