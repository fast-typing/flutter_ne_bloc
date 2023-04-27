import 'package:flutter/material.dart';
import 'package:meels/CustomTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const themeKey = 'theme';
  ThemeData _theme = CustomTheme.lightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Очень крутое приложение'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pizza');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Icon(Icons.fastfood_rounded, size: 40,),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/fast-food');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Icon(Icons.login_rounded, size: 40,),
                      )
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _theme = _theme == CustomTheme.lightTheme ? CustomTheme.darkTheme : CustomTheme.lightTheme;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Icon(Icons.dark_mode, size: 40,),
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/typing');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 50),
                        child: Icon(Icons.keyboard, size: 40,),
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}