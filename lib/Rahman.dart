import 'package:assets_audio_player/assets_audio_player.dart';
import 'Sid.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'Haris.dart';
import 'Yuvan.dart';

bool isPlaying = false;
int currentindex = 0;

class Rahman extends StatefulWidget {
  const Rahman({Key? key}) : super(key: key);

  @override
  State<Rahman> createState() => _RahmanState();
}

class _RahmanState extends State<Rahman> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  void initState() {
    super.initState();
    setAudio();
    assetsAudioPlayer.playerState.listen(
      (State) {
        setState(() {
          isPlaying = State == PlayerState.play;
        });
      },
    );
  }

  @override
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
                "https://raw.githubusercontent.com/Chandirasegaran/segar_radio/main/Artists/rahman.jpg",
                height: height * 0.50,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Text(
                "A.R.Rahman Radio",
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
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                label: 'Anirudh', icon: Icon(Icons.radio_outlined)),
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
              if (index == 0) {
                print('Hi Anirudh');
                assetsAudioPlayer.playerState.listen(
                  (State) {
                    setState(() {
                      isPlaying = State == PlayerState.pause;
                    });
                  },
                );
                assetsAudioPlayer.pause();
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              } else if (index == 2) {
                print("hi Sid");
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
            "https://stream-60.zeno.fm/3z615n343d0uv?zs=Oo3H4A3zRLq0yB-lqueEaQ"),
        showNotification: true,
      );
    } catch (t) {
      //mp3 unreachable
    }
  }
}
