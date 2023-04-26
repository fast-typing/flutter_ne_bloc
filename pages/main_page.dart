import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Очень крутое приложение'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Switch(         Темная / Светлая тема
          //   value: light,
          //   activeColor: Colors.blueAccent,
          //   onChanged: (bool value) {
          //     setState(() {
          //       light = value;
          //     });
          //   },
          // ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pizza');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Icon(Icons.local_pizza_rounded, size: 40,),
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fast-food');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Icon(Icons.fastfood_rounded, size: 40,),
                    )
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Icon(Icons.dark_mode, size: 40,),
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/pig');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                      child: Icon(Icons.savings, size: 40,),
                    )
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


