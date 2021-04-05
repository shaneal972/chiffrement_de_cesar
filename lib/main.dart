import 'package:flutter/material.dart';

import 'cesar.dart';
import 'cesar_lock.dart';
import 'chiffrement.dart';

void main() {
  runApp(CesarCode());
}

class CesarCode extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // "/cesar_lock" route, construit le CesarLock widget.
        '/cesar_lock': (context) => CesarLock(),
      },
      title: 'Flutter : Chiffrement de César',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Cesar(),
    );
  }
}

