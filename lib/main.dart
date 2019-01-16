import 'package:flutter/material.dart';
import 'package:leyline_game/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            theme: new ThemeData(primaryColor: Colors.blueGrey),
            home: new HomePage(),
        );
    }
}
