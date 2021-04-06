import 'package:flutter/material.dart';

class CesarLock extends StatefulWidget {
  @override
  _CesarLockState createState() => _CesarLockState();
}

class _CesarLockState extends State<CesarLock> {
  final _secretController = TextEditingController();
  var _textCrypteController = TextEditingController();
  List<String> _tabMessage = [];
  List<String> _alphabet = [];
  List<String> messageSecret = [];


  var _formKey = GlobalKey<FormState>();
  List<String> messageClair = [];
  String messageCrypte;
  int code;

  _deleteMessage() {
    _secretController.clear();
  }

  _dechiffrerMessage() {
    print(_tabMessage);

    messageClair = [];
    setState(() {
      messageCrypte = _textCrypteController.text;
      code = int.parse(_secretController.text);
      int i = 0;
      String lettre = "";
      String lettreClair = "";

      while (i < messageCrypte.length) {
        lettre = messageCrypte[i];
        var indexLettreInTabMessage = _tabMessage.indexOf(lettre);

        lettreClair = _alphabet[indexLettreInTabMessage];

        messageClair.add(lettreClair);

        i++;
      }
      Navigator.pushNamed(
        context,
        '/cesar',
        arguments: {
          'mesageClair' : messageClair,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    messageSecret = args['messageSecret'];
    int secret = args['secret'];
    _tabMessage = args['tabMessage'];
    _alphabet = args['alphabet'];
    String textCrypte = "";
    String textClair = "";

    for (int i = 0; i < messageSecret.length; i++) {
      textCrypte += messageSecret[i];
    }

    for (int i = 0; i < messageClair.length; i++) {
      textClair += messageClair[i];
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chiffrement de César",
        ),
      ),
      body: SafeArea(
        child: Form(
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
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.lock,
                                size: 30.0,
                                color: Colors.deepPurple,
                              ),
                              title: TextField(
                                controller: _textCrypteController,
                                onTap: () {
                                  setState(() {
                                    _textCrypteController.text = textCrypte;
                                    _secretController.text = secret.toString();
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: TextField(
                                controller: _secretController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '''
                                Message en clair : 
                                ${textClair}
                                ''',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                maxLines: 5,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: Text("Déchiffrer"),
                      onPressed: _dechiffrerMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
