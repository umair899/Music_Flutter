import 'dart:ui';

 import 'package:flutter/material.dart';
 import 'package:music_flutter/widget/database.dart';

class MusicPlayer extends StatefulWidget {
  final Song song;
  MusicPlayer(this.song);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

double currentSlider = 0;

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'images',
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.song.images), fit: BoxFit.cover),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Umair",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Pakistan",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8, left: 15),
                child: Icon(
                  Icons.notifications_on_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 14.0,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.4))
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.song.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  // primary: Colors.transparent
                                  ),
                              onPressed: () {
                                // final player = AudioPlayer();
                                // player.play(AssetSource('new.mp3'));
                              },
                              child: Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            widget.song.singer,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              // thumbColor: RoundSliderThumbShape(enabledThumbRadius: 2),
                              trackShape: RectangularSliderTrackShape(),
                              trackHeight: 6,
                            ),
                            child: Slider(
                              value: currentSlider,
                              max: widget.song.duration.toDouble(),
                              min: 0,
                              inactiveColor: Colors.white70,
                              activeColor: Colors.red,
                              onChanged: (val) {
                                currentSlider = val;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                Duration(seconds: currentSlider.toInt())
                                    .toString()
                                    .split(".")[0]
                                    .substring(2),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                Duration(seconds: widget.song.duration)
                                    .toString()
                                    .split(".")[0]
                                    .substring(2),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
