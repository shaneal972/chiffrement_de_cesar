import 'package:flutter/material.dart';


class Cesar extends StatefulWidget {
  @override
  _CesarState createState() => _CesarState();
}

class _CesarState extends State<Cesar> {
  final _secretController = TextEditingController();
  final _messageController = TextEditingController();
  List<String> tabMessage;
  List<String> alphabet;


  List<String> decalageAlphabet(List<String> alphabet, int decalage){
    tabMessage = [];
    for(int i = 0; i < alphabet.length; i++) {
      var lettre;
      var limite = alphabet.length - alphabet.indexOf(alphabet[i]);
      if (limite <= decalage) {
        var indexLimite = decalage - limite;
        lettre = alphabet[indexLimite];
      } else {
        lettre = alphabet[alphabet.indexOf(alphabet[i + decalage])];
      }
      tabMessage.add(lettre);
    }
    return (tabMessage);
  }

  @override
  void initState() {
    alphabet = [
      "A", "À", "B", "C", "D", "E", "É", "È", "Ê", "F", "G", "H", "I", "Ï", "J", "K", "L", "M", "N", "O",
      "Œ", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    super.initState();
  }

  var _formKey = GlobalKey<FormState>();
  String message;
  String codeSecret;

  List<String> messageSecret = [];

  _chiffrerMessage() {
    messageSecret = [];
    setState(() {
      message = _messageController.value.text;
      message = message.replaceAll(' ', '');
      int secret = int.parse(_secretController.value.text);
      String lettre = "";
      int index = 0;

      while (index < message.length) {
        tabMessage = decalageAlphabet(alphabet, secret);
        lettre = message[index].toUpperCase();

        var indexLettreInAlphabet = alphabet.indexOf(lettre);
        codeSecret = tabMessage[indexLettreInAlphabet];
        messageSecret.add(codeSecret);

        index++;
      }

      Navigator.pushNamed(
        context,
        '/cesar_lock',
        arguments: {
          'messageSecret': messageSecret,
          'secret' : secret,
          'tabMessage' : tabMessage,
          'alphabet' : alphabet
        },
      );
      _deleteMessage();
    });
  }

  _deleteMessage() {
    _messageController.clear();
    _secretController.clear();
  }

  @override
  void dispose() {
    _secretController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chiffrement de César",
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.0),
            ),
            Container(
              // color: Colors.grey,
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.lock_open,
                      size: 30.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      validator: (value) {
                        if (_messageController.value.text == "") {
                          return "Vous devez renseigner ce champ";
                        } else {
                          return value;
                        }
                      },
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: "Entrez votre message",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          var message = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    "Décalage : ",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _secretController,
                      validator: (value) {
                        if (_messageController.value.text == "") {
                          return "Vous devez renseigner ce champ";
                        } else {
                          return value;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Tapez un chiffre",
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          var secret = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text("Chiffrer"),
                    onPressed: _chiffrerMessage,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text("Effacer"),
                    onPressed: _deleteMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
