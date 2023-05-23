import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:skismi/main_screen.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/payment/subcription_ask.dart';
import 'package:skismi/providers/subscription_provider.dart';
import 'package:skismi/status/blockuser.dart';

class CheckExpertSubscription extends StatefulWidget {
  const CheckExpertSubscription({super.key});

  @override
  State<CheckExpertSubscription> createState() =>
      _CheckExpertSubscriptionState();
}

class _CheckExpertSubscriptionState extends State<CheckExpertSubscription> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      check();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Checking subscription status"),
      ),
    );
  }

  void check() async {
    final subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    /*final DocumentSnapshot userSnapshot = await userRef.get();
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
    final isBlocked = data['paid'];
    final isTaken = data['subscriptionTaken'];*/
    subscription.checkUserSubscription();
    if (subscription.activeSubscription) {
      print("running =>>>> ");
      // User is blocked
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => Experts()));
    } else {
      print("running =>>>> running ");
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


