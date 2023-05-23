import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skismi/messages/chat_screen.dart';

import 'package:skismi/messages/messageai.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class RunesWebPage extends StatefulWidget {
  const RunesWebPage({super.key});

  @override
  State<RunesWebPage> createState() => _RunesWebPageState();
}

class _RunesWebPageState extends State<RunesWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/gold.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url: "https://skismi.com/runes-results/",
                            title: "Runes Reading",
                          )));
            },
            child: Text("Get Your Runes Reading"),
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
                "name": "Runes Reading",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatScreen(
                              name: "Runes Reading",
                              uuid: uuid,
                            )));
              });
            },
            child: Text("Chat with a Runes Reading Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/runes-results/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
