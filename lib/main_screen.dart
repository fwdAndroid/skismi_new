import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:skismi/ads/ads_service.dart';
import 'package:skismi/main_screen_pages/chatpage.dart';
import 'package:skismi/main_screen_pages/experts.dart';
import 'package:skismi/main_screen_pages/settings.dart';
import 'package:skismi/messages/chat_screen.dart';
import 'package:skismi/payment/subcription_ask.dart';
import 'package:skismi/providers/subscription_provider.dart';
import 'package:skismi/separateTrailPage.dart';
import 'package:skismi/status/checkexpertsubscription.dart';
import 'package:skismi/webpages/webpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final List<String> imgList = [
    'assets/blackball.png',
    'assets/gold.png',
    'assets/ww.png',
    'assets/women.png',
    'assets/hs.png',
    'assets/clouds.png',
    'assets/cjs.png',
  ];
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  void initState() {
    _loadBannerAd();
    _createInterstitialAd();
  }

  InterstitialAd? _interstitialAd;

  @override
  Widget build(BuildContext context) {
    final subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("paid", isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: _bannerAd.size.width.toDouble(),
                        height: _bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      ),
                    );
                  }),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              height: 50,
              child: Text(
                "Welcome to the Skismi app. Discover your destiny with Skismi's AI-generated divinations",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: GestureDetector(
              child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: choices
                    .map((Choice) => Container(
                          height: MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (builder) => ChatScreen(
                              //             name: Choice.content,
                              //             uuid: Choice.content)));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Choice.title,
                                    fit: BoxFit.fill,
                                    width: 250,
                                    height: 250,
                                  ),
                                ),
                                Text(
                                  Choice.content,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )),
            ElevatedButton(
              onPressed: () async {
                final documentReference = FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid);
                final snapshot = await documentReference.get();
                Map<String, dynamic> data =
                    snapshot.data() as Map<String, dynamic>;
                var count = data['count'];
                print("count ==>>> $count");
                if(subscription.activeSubscription) {
                  setState(() {
                    count = 10000;
                  });
                }
                final pay = data['paid'];
                final taken = data['subscriptionTaken'];

                if (count > 0 ) {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: subscription.activeSubscription ? Text(
                            'Choose Your Reading',
                            style: TextStyle(fontSize: 15),
                          ) : Text(
                            'Choose Your Free Reading',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              TextButton(
                                child: Text("Weekly Horoscope Readings"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title: "Horoscope Readings",
                                                url:
                                                    "https://skismi.com/horoscope-results/",
                                              )));
                                },
                              ),
                              TextButton(
                                child: Text("One Card Tarot Card Readings"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "One Card Tarot Card Readings",
                                                url:
                                                    "https://skismi.com/tarot-card-results-trial/",
                                              )));
                                },
                              ),
                              TextButton(
                                child: Text("Orcale Consultations"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title: "Oracle Consultations",
                                                url:
                                                    "https://skismi.com/oracle-test/",
                                              )));
                                },
                              ),
                              TextButton(
                                child: Text("Crystal Ball Readings"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title: "Crystal Ball Reading",
                                                url:
                                                    "https://skismi.com/crystal-ball-reading/",
                                              )));
                                },
                              ),
                              TextButton(
                                child: Text("Magic Eight-Ball Answers"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Magic Eight-Ball Answers",
                                                url:
                                                    "https://skismi.com/magic-eight-ball-results/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: !subscription.activeSubscription ? Text(
                                'Free plans get three free readings per week.',
                                style: TextStyle(fontSize: 15),
                              ) : Text(
                                    "You have unlimited readings",
                                    style: TextStyle(fontSize: 15),), )
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"))
                        ],
                      );
                    },
                  );
                } else if (count == 0 || pay == false || taken == false) {
                  _showInterstitialAd();
                  subscription.checkUserSubscription();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => SubsriptionAsk()));
                }
              },
              child: subscription.activeSubscription ? Text(
                "My Readings",
                style: TextStyle(color: Colors.white),
              ) : Text(
                "Free Readings",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(), fixedSize: Size(200, 60)),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 60,
                margin: EdgeInsets.only(right: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("users")
                          .where(
                            "uid",
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                          )
                          .where("paid", isEqualTo: false)
                          .where("subscriptionTaken", isEqualTo: false)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }

                        return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Column(
                            children: [
                              subscription.activeSubscription ? const Text(
                                "You have unlimited readings",
                                style: TextStyle(color: Colors.white),
                              ) : const Text("Free Readings Left This Week",
                                style: TextStyle(color: Colors.white),),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: !subscription.activeSubscription ? Text(
                                  data['count'].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ) : null,
                              ),
                            ],
                          );
                        }).toList());
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Rooms
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CheckExpertSubscription()));
                    },
                    child: Image.asset(
                      "assets/black.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //Trail

                  //Privacy
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => AppSettings()));
                    },
                    child: Image.asset(
                      "assets/setting.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  //Chat
                  SizedBox(
                    width: 30,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MyWidget(
                                    url: "https://skismi.com/appvideos/",
                                    title: "Video Page",
                                  )));
                    },
                    child: Image.asset(
                      "assets/video.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            // _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            // _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            _createInterstitialAd();
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }
}

//?Coursel Class
class Choice {
  const Choice({required this.title, required this.content});

  final String title;

  final String content;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'assets/blackball.png',
      content: 'The Magic Eight-Ball has answers to your questions'),
  const Choice(
      title: 'assets/gold.png',
      content: 'Uncover the timeless wisdom of the Runes'),
  const Choice(
      title: 'assets/ww.png', content: 'Let the wisdom of the Tarot guide you'),
  const Choice(
      title: 'assets/women.png',
      content: 'Stare into the Crystal Ball with me'),
  const Choice(
      title: 'assets/hs.png', content: 'The I Ching has answers for you'),
  const Choice(
      title: 'assets/clouds.png',
      content: 'Discover the meaning of your dreams'),
  const Choice(
      title: 'assets/cjs.png',
      content: 'Find ancient wisdom with your Chinese Horoscope'),
  const Choice(
      title: "assets/h.png",
      content:
          "Get daily insights into love, work, and health with our personalized, AI-powered horoscope readings"),
  const Choice(
      title: "assets/asd.png",
      content:
          "Explore life path, destiny, and soul urge numbers for unique guidance and self-discovery.")
];
