import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HamburgerPage extends StatefulWidget {
  const HamburgerPage({Key? key}) : super(key: key);

  @override
  State<HamburgerPage> createState() => _HamburgerPageState();
}

class _HamburgerPageState extends State<HamburgerPage> {
  static const bytesKey = 'bytes';

  int _bytes = 0;
  final int _maxBytes = 5;

  void initState() {
    _initCounter();
    super.initState();
  }

  Future _initCounter() async {
    _bytes = await _getCounter();
    setState(() {
      _bytes = _bytes;
    });
  }

  Future _setCounter() async {
    var res = await SharedPreferences.getInstance();
    res.setInt(bytesKey, _bytes);
  }

  Future _getCounter() async {
    var res = await SharedPreferences.getInstance();
    return res.getInt(bytesKey) ?? 0;
  }

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
                  _bytes >= _maxBytes ? Text('УРАААА! Ты наелся', style: TextStyle(fontSize: 30)) : Text('Сьешь его!!', style: TextStyle(fontSize: 30)),
                  Padding(padding: EdgeInsets.only(top:5)),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      _bytes = 0;
                    });
                    _setCounter();
                  }, child: Icon(Icons.restart_alt_rounded)),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              setState(() {
                _bytes >= _maxBytes ? _bytes : _bytes++;
              });
              _setCounter();
          },
          child: Icon(Icons.add_rounded),
        ),
    );
  }
}
