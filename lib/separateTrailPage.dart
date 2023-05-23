import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skismi/main_screen.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/payment/subcription_ask.dart';
import 'package:skismi/status/blockuser.dart';
import 'package:skismi/webpages/webpage.dart';

class SeparateTrailPage extends StatefulWidget {
  const SeparateTrailPage({super.key});

  @override
  State<SeparateTrailPage> createState() => _SeparateTrailPageState();
}

class _SeparateTrailPageState extends State<SeparateTrailPage> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Checking Users Payment Status"),
      ),
    );
  }

  void check() async {
    final DocumentSnapshot userSnapshot = await userRef.get();
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;

    ;
    final isBlocked = data['paid'];
    final isTaken = data['subscriptionTaken'];
    if (isBlocked == true && isTaken == true) {
      // User is blocked
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => MyWidget(
                    url: "https://skismi.com/tarot-card-results-trial/",
                    title: "Trial Page",
                  )));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SubsriptionAsk()));
    }
  }
}

// // Reference to the user's document
// final DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc('user_id');

// // Query the user's document
// final DocumentSnapshot userSnapshot = await userRef.get();

// // Check if the user is blocked or unblocked
// final bool isBlocked = userSnapshot.data()['blocked'];

// if (isBlocked) {
//   // User is blocked
// } else {
//   // User is unblocked
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// // Reference to the user's document
// final DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc('user_id');

// // Query the user's document
// final DocumentSnapshot userSnapshot = await userRef.get();

// // Check if the user is blocked or unblocked
// final bool isBlocked = userSnapshot.data()['blocked'];


