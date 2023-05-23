import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/messages/messageai.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class ChingReadingWebPage extends StatefulWidget {
  const ChingReadingWebPage({super.key});

  @override
  State<ChingReadingWebPage> createState() => _ChingReadingWebPageState();
}

class _ChingReadingWebPageState extends State<ChingReadingWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset("assets/hs.png"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => MyWidget(
                            url: "https://skismi.com/i-ching-results/",
                            title: " I Ching Reading",
                          )));
            },
            child: Text("Get Your I Ching Reading "),
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
                "name": "Ching Reading",
                "uuid": uuid,
                "uid": FirebaseAuth.instance.currentUser!.uid
              }).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChatScreen(
                              name: "Ching Reading",
                              uuid: uuid,
                            )));
              });
            },
            child: Text("Chat with an I Ching Expert"),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    final Uri _url = Uri.parse('https://skismi.com/i-ching-results/');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
