import 'package:flutter/material.dart';

class PizzaPage extends StatefulWidget {
  const PizzaPage({Key? key}) : super(key: key);

  @override
  State<PizzaPage> createState() => _PizzaPage();
}

class _PizzaPage extends State<PizzaPage> {
  String _userText = '';
  List ings = [];

  @override
  void initState() {
    super.initState();

    ings.addAll(['Лук', 'Помидоры', 'Колбаса']);
  }

  // void _menuOpen() {
  //   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
  //     return Scaffold(
  //         appBar: AppBar(title: Text('Menu')),
  //         body: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 OutlinedButton(onPressed: () {
  //                   Navigator.pushReplacementNamed(context, '/');
  //                 },
  //                     child: Padding(
  //                       padding: EdgeInsets.all(20),
  //                       child: Text('Main Page', style: TextStyle(fontSize: 40)),
  //                     )
  //                 ),
  //                 OutlinedButton(onPressed: () {
  //                   Navigator.pushReplacementNamed(context, '/todo');
  //                 },
  //                     child: Padding(
  //                       padding: EdgeInsets.all(20),
  //                       child: Text('TODO Page', style: TextStyle(fontSize: 40)),
  //                     )
  //                 ),
  //               ],
  //             )],
  //         )
  //     );
  //   })
  //   );
  // }

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
                          setState(() {
                            ings.removeAt(index);
                          });
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.blueAccent,
                        )
                    ),
                  )

              )),
              onDismissed: (direction) {
                setState(() {
                  ings.removeAt(index);
                });
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

