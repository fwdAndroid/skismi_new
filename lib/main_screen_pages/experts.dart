import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi/main_screen.dart';
import 'package:skismi/webpages/chinesewebpage.dart';
import 'package:skismi/webpages/chineshorswebpage.dart';
import 'package:skismi/webpages/chingreadingwebpage.dart';
import 'package:skismi/webpages/crystalwebpage.dart';
import 'package:skismi/webpages/dreamwebpage.dart';
import 'package:skismi/webpages/magicwebpage.dart';
import 'package:skismi/webpages/nomrology_web_page.dart';
import 'package:skismi/webpages/oraclewebpage.dart';
import 'package:skismi/webpages/runnswebpage.dart';
import 'package:skismi/webpages/tarrotwebpage.dart';
import 'package:skismi/webpages/webpage.dart';

class Experts extends StatefulWidget {
  const Experts({super.key});

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  int count = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => MainScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text("Skismi",
            style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChinesHoroWebPage()));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => MyWidget(
                    //               title: "Horoscope Readings",
                    //               url: "https://skismi.com/horoscope-results/",
                    //             )));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/h.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Horoscope Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your Horoscope readings can offer you insights into love, career, health, and finances based on your unique astrological profile, providing guidance for personal growth and self-discovery.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => TarrotWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/ww.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Tarot Card Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tarot is a form of divination in which our AI bot will draw cards from the 78 card tarot deck to gain insight and illumination about your situation",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChineseWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/cjs.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Chinese Horoscopes",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "The Chinese zodiac is a traditional classification scheme based on the Chinese calendar that assigns an animal and its reputed attributes to each year in a repeating twelve-year cycle",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => NormWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/asd.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Numerology Reports",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Discover your unique numerological profile with our in-depth report, revealing insights about your life path, destiny, and personality based on your birth date and name. Uncover your hidden potential and life patterns.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OrcaleWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/oracle.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Oracle Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Consulting the Oracle is a great way to get a sense of your future.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => ChingReadingWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/hs.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "I Ching Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "I Ching (Yijing) oracle is based on the 64 principles from the Book of Changes with interpretations inspired by the elements of nature.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => RunesWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/gold.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Runes Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Runes Readings: Our AI-generated runes Readings app unlocks the mysteries of the ancient world, providing personalized insights into your future through the interpretation of runic symbols.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => CrystalWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/women.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Crystal Ball Readings",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Crystal ball: As our AI bot gazes into the crystal ball it describes the ups, downs and adventures it sees in your future.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => DreamWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/clouds.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Dream Interpretations",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Dream Interpretations: Our AI bot will discuss the patterns, themes and symbols in your dreams and their meanings for your waking life.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 360,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xff7A8194),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MagicWebPage()));
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/blackball.png",
                        height: 54,
                      ),
                    ],
                  ),
                  title: Text(
                    "Magic Eight Ball Answers",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "The Magic Eight-Ball can answer your deepest questions.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
