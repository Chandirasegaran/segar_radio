import 'Sid.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Rahman.dart';
import 'Haris.dart';
import 'Yuvan.dart';

void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(const MyApp());
}

bool isPlaying = false;
int currentindex = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Segar Radio",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          splash: Icon(
            Icons.radio_outlined,
            size: 100,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: MyHomePage(),
        ) // MyHomePage(),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
// final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    setAudio();
    assetsAudioPlayer.playerState.listen((State) {
      setState(() {
        isPlaying = State == PlayerState.play;
      });
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.radio_outlined),
        title: Text('Segar Radio'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
          margin: EdgeInsets.all(15),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://raw.githubusercontent.com/Chandirasegaran/segar_radio/main/Artists/anirudh.jpg",
                height: height * 0.50,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Text(
                "Anirudh Radio",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Times new Roman"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                icon: Icon(isPlaying
                    ? Icons.stop_outlined
                    : Icons.play_arrow_outlined),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                    assetsAudioPlayer.pause();
                  } else {
                    assetsAudioPlayer.play();
                  }
                },
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                label: 'Anirudh',
                icon: Icon(Icons.radio_outlined)),
            BottomNavigationBarItem(
                label: 'A.R.Rahman', icon: Icon(Icons.radio_outlined)),
            BottomNavigationBarItem(
                label: 'Sid Sriram', icon: Icon(Icons.radio_outlined)),
            BottomNavigationBarItem(
                label: 'Yuvan', icon: Icon(Icons.radio_outlined)),
            BottomNavigationBarItem(
                label: 'Haris', icon: Icon(Icons.radio_outlined)),
          ],
          onTap: (index) {
            setState(() {
              currentindex = index;
              print(index);
              if (index == 1) {
                print("hi Rahman");
                assetsAudioPlayer.playerState.listen(
                  (State) {
                    setState(() {
                      isPlaying = State == PlayerState.pause;
                    });
                  },
                );
                assetsAudioPlayer.pause();
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Rahman()));
              } else if (index == 2) {
                print("hi sid");
                assetsAudioPlayer.playerState.listen(
                  (State) {
                    setState(() {
                      isPlaying = State == PlayerState.pause;
                    });
                  },
                );
                assetsAudioPlayer.pause();
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sid()));
              } else if (index == 3) {
                print("hi Yuvan");
                assetsAudioPlayer.playerState.listen(
                  (State) {
                    setState(() {
                      isPlaying = State == PlayerState.pause;
                    });
                  },
                );
                assetsAudioPlayer.pause();
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Yuvan()));
              } else if (index == 4) {
                print("hi Haris");
                assetsAudioPlayer.playerState.listen(
                  (State) {
                    setState(() {
                      isPlaying = State == PlayerState.pause;
                    });
                  },
                );
                assetsAudioPlayer.pause();
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Haris()));
              }
            });
          }),
    );
  }

  Future setAudio() async {
    try {
      await assetsAudioPlayer.open(
        Audio.network(
            "https://psrlive1.listenon.in/anirud?station=anirudhradio"),
        showNotification: true,
      );
    } catch (t) {
      //mp3 unreachable
      print("Error Segar");
    }
  }
}
