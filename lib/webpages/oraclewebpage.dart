import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/messages/messageai.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:uuid/uuid.dart';

class OrcaleWebPage extends StatefulWidget {
  const OrcaleWebPage({super.key});

  @override
  State<OrcaleWebPage> createState() => _OrcaleWebPageState();
}

class _OrcaleWebPageState extends State<OrcaleWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/oracle.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url: "https://skismi.com/oracle-test/",
                            title: "Oracle Reading",
                          )));
            },
            child: Text("Get Your Oracle Reading"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              var uuid = Uuid().v4();
              FirebaseFirestore.instance
                  .collection("cardsreading")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("messageslist")
                  .doc(uuid)
                  .set({
                "name": "Oracle Reading",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatScreen(
                              name: "Oracle Reading",
                              uuid: uuid,
                            )));
              });
            },
            child: Text("Chat with the Oracle"),
          )
        ],
      ),
    );
  }
}
