import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skismi/database/databasemethods.dart';
import 'package:skismi/providers/subscription_provider.dart';
import 'package:skismi/status/blockstatus.dart';
import 'package:skismi/user_info.dart';

class CheckStatus extends StatefulWidget {
  const CheckStatus({super.key});

  @override
  State<CheckStatus> createState() => _CheckStatusState();
}

class _CheckStatusState extends State<CheckStatus> {


  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkresult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkresult() async {
    //final subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;
    if (doesDocExist) {
      print("running =>>>> ");
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => UserStatus()));
    } else {
      DatabaseMethods().numberAdd().then((value) {
      print("running =>>>> running ");
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => ProfileInfo()));
          });
    }
  }
}
