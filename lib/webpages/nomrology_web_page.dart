import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skismi/main_screen_pages/chatpage.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/messages/messageai.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class NormWebPage extends StatefulWidget {
  const NormWebPage({super.key});

  @override
  State<NormWebPage> createState() => _NormWebPageState();
}

class _NormWebPageState extends State<NormWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/asd.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url: "https://skismi.com/numerology-results/",
                            title: "Numerology Reports",
                          )));
            },
            child: Text("Get a Numerology Reports"),
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
                "name": "Tarot Card",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatScreen(
                              name: "Numerology Reports",
                              uuid: uuid,
                            )));
              });
            },
            child: Text("Chat with a Numerology Expert"),
          )
        ],
      ),
    );
  }
}
