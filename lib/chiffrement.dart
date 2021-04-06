class Chiffrement {
  int decalage;

  List<String> alphabet = [
    "A",
    "À",
    "B",
    "C",
    "D",
    "E",
    "É",
    "È",
    "Ê",
    "F",
    "G",
    "H",
    "I",
    "Ï",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "Œ",
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
  List<String> messageSecret;

  List<String> decalageAlphabet(List<String> alphabet, int decalage) {
    alphabetSecret = [];
    for (int i = 0; i < alphabet.length; i++) {
      var lettre;
      var limite = alphabet.length - alphabet.indexOf(alphabet[i]);
      if (limite <= decalage) {
        var indexLimite = decalage - limite;
        lettre = alphabet[indexLimite];
      } else {
        lettre = alphabet[alphabet.indexOf(alphabet[i + decalage])];
      }
      alphabetSecret.add(lettre);
    }
    return (alphabetSecret);
  }

  ///
  List<String> chiffrerMessage(String message) {
    var codeSecret, lettre;
    int index = 0;

    while (index < message.length) {
      alphabetSecret = decalageAlphabet(alphabet, decalage);
      lettre = message[index].toUpperCase();

      var indexLettreInAlphabet = alphabet.indexOf(lettre);
      codeSecret = alphabetSecret[indexLettreInAlphabet];

      messageSecret.add(codeSecret);

      index++;
    }

    return messageSecret;
  }
}
