import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:skismi/auth/email_auth.dart';
import 'package:skismi/database/databasemethods.dart';
import 'package:skismi/providers/subscription_provider.dart';
import 'package:skismi/status/checkstatus.dart';
import 'package:skismi/user_info.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png"),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: SocialLoginButton(
              buttonType: SocialLoginButtonType.google,
              onPressed: () async {
                await DatabaseMethods().signInWithGoogle().then((value) async {
                  await subscription.checkUserSubscription();
                  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CheckStatus()));
                    });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(340, 50), backgroundColor: Colors.black),
              child: Text(
                "Sign In with Apple",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => EmailAuth()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
