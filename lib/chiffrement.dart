import 'package:flutter/material.dart';
import 'cesar.dart';

class Chiffrement {
  List<String> alphabet = [ "A", "B", "C", "D", "E", "F", "G", "H", "I",
    "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
    "Y", "Z"];

  List<String> alphabetSecret;

  List<String> chiffrerAlphabet(List<String> alphabet, int secret){
    for(int i = 0; i < alphabet.length; i++){
      alphabetSecret.add(alphabet[i + secret]);
    }
    print(alphabetSecret);
    return alphabetSecret;
  }



}