import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PizzaPage extends StatefulWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  State<PizzaPage> createState() => _PizzaPage();
}

class _PizzaPage extends State<PizzaPage> {
  static const ingsKey = 'ings';
  String _userText = '';
  List<String> ings = [];

  @override
  void initState() {
    super.initState();
    _initCounter();

    ings.addAll(['Лук', 'Помидоры', 'Колбаса']);
  }

  Future _initCounter() async {
    ings = await _getCounter();
    setState(() {
      ings = ings;
    });
  }

  Future _getCounter() async {
    var res = await SharedPreferences.getInstance();
    return res.getStringList(ingsKey) ?? [];
  }

  Future _setCounter() async {
    var res = await SharedPreferences.getInstance();
    res.setStringList(ingsKey, ings);
  }

  Future _remIng(index) async {
    setState(() {
      ings.removeAt(index);
    });
    _setCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рецепт вашей пиццы'),
        // actions: [
        //   IconButton(
        //       onPressed: _menuOpen,
        //       icon: Icon(Icons.menu)
        //   )
        // ],
      ),
      body: ListView.builder(
          itemCount: ings.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(ings[index]),
              child: Card(child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(ings[index]),
                    trailing: IconButton(
                        onPressed: () {
                          _remIng(index);
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.blueAccent,
                        )
                    ),
                  )

              )),
              onDismissed: (direction) {
                _remIng(index);
              },
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить ингредиент'),
              content: TextField(
                onChanged: (String value) {
                  _userText = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  if (_userText.length > 0)
                    setState(() {
                      ings.add(_userText);
                      _userText = '';
                    });
                    Navigator.of(context).pop();
                    _setCounter();
                  },
                    child: Text('Готово'))
              ],
            );
          });
        },
        child: Icon(Icons.add_rounded, color: Colors.white,),),
    );
  }
}

