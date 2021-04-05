import 'package:flutter/material.dart';

class CesarLock extends StatefulWidget {
  @override
  _CesarLockState createState() => _CesarLockState();
}

class _CesarLockState extends State<CesarLock> {
  final _secretController = TextEditingController();
  var _textCrypteController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  _deleteMessage() {
    _secretController.clear();
  }

  _dechiffrer() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    var messageSecret = args['messageSecret'];
    int secret = args['secret'];
    String textCrypte = "";



    for (int i = 0; i < messageSecret.length; i++) {
      textCrypte += messageSecret[i];
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
                                  _textCrypteController.text = textCrypte;

                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                '''
                                Text décrypté
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
                      onPressed: _dechiffrer,
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
