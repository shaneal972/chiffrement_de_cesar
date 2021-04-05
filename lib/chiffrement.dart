import 'package:flutter/material.dart';
import 'cesar.dart';

class  Chiffrement {



  List<String> alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  List<String> alphabetSecret;

  List<String> chiffrerAlphabet(
      List<String> alphabet, int secret, String message,
      {int index = 0}) {
    var codeSecret;
    List<String> messageSecret;
    while (index < message.length) {
      String lettre = message[index].toUpperCase();
      var indexLettreInAlphabet = alphabet.indexOf(lettre);
      var limite = alphabet.length - indexLettreInAlphabet;
      if (limite < secret) {
        var indexLimite = secret - limite;
        codeSecret = alphabet[indexLimite];
      }else{
        codeSecret = alphabet[indexLettreInAlphabet + secret];
      }
      messageSecret.add(codeSecret);
      index++;
    }
  }




}
