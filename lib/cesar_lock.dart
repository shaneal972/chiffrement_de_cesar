import 'package:flutter/material.dart';

class CesarLock extends StatefulWidget {
  @override
  _CesarLockState createState() => _CesarLockState();
}

class _CesarLockState extends State<CesarLock> {


  @override
  Widget build(BuildContext context) {
    final List<String> messageCrypte = ModalRoute.of(context).settings.arguments as List;
    String textCrypte = "";
    int nbChar = 0;

    for(int i = 0; i < messageCrypte.length; i++){
      textCrypte += messageCrypte[i];
    }



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chiffrement de César",
        ),
      ),
      body: SafeArea(
        child: Text(textCrypte),
      ),
    );
  }
}
