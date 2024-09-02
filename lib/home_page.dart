import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:music_flutter/musicplayer.dart';
import 'package:music_flutter/widget/database.dart';

import 'widget/track_widget.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black.withOpacity(0.8),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.transparent),
                  accountName: Text("umair ali"),
                  accountEmail: Text("umair987@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://imageio.forbes.com/specials-images/imageserve/5ed564163dbc9800060b2829/0x0.jpg?format=jpg&crop=1080,1080,x0,y0,safe&height=416&width=416&fit=bounds"),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(CupertinoIcons.forward, color: Colors.white),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(CupertinoIcons.forward, color: Colors.white),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Email Me",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  CupertinoIcons.forward,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        elevation: 0,
        // leading: Icon(Icons.search),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Umair",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Pakistan",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 8, left: 15),
            child: Icon(Icons.notifications_on_outlined),
          ),
        ],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "most",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "popular",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20, top: 10),
                child: Text(
                  "960 playlists",
                  style: TextStyle(
                      // fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              Container(
                height: 300,
                child: Trackwidget((refresh)),
              ),
              CircleTrackWidget(
                song: newrelease,
                title: 'new release',
                subtitle: "1342 songs",
                notifyparent: refresh,
              ),
              CircleTrackWidget(
                song: newrelease,
                title: 'your playlist',
                subtitle: "342 songs",
                notifyparent: refresh,
              ),
              SizedBox(
                height: 120,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PlayerHome(currentSong),
        )
      ]),
    );
  }

  refresh() {
    setState(() {});
  }
}

Song currentSong = Song(
  name: 'title',
  singer: 'singer',
  images: 'assets/1.jpg',
  duration: 100,
  color: Colors.black,
);
double currentSlider = 0;

class PlayerHome extends StatefulWidget {
  final Song song;
  PlayerHome(this.song);
  @override
  State<PlayerHome> createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, _, __) => MusicPlayer(widget.song),
          ),
        );
      },
      child: Container(
        height: 150,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "images",
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.song.images,
                        ),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.song.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Text(
                          widget.song.singer,
                          style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white54),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                            // primary: Colors.transparent
                            ),
                      onPressed: (() {
                        final player = AudioPlayer();
                        player.play(AssetSource('new.mp3'));
                        setState(() {
                          click = !click;
                        });
                      }),
                      child: Icon(
                        (click == false) ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                            // primary: Colors.transparent
                            ),
                      onPressed: () {
                        final player = AudioPlayer();
                        player.stop();
                      },
                      child: Icon(
                        Icons.skip_next_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            Container(
              width: MediaQuery.of(context).size.width,
              child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                    trackShape: RectangularSliderTrackShape(),
                    trackHeight: 4,
                  ),
                  child: Slider(
                      value: currentSlider,
                      max: widget.song.duration.toDouble(),
                      min: 0,
                      inactiveColor: Colors.grey[500],
                      activeColor: Colors.white,
                      onChanged: (val) {
                        setState(() {
                          currentSlider = val;
                        });
                      })),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> song;
  final String subtitle;
  final Function() notifyparent;

  const CircleTrackWidget({
    required this.title,
    required this.song,
    required this.subtitle,
    required this.notifyparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: song.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    currentSong = song[index];
                    currentSlider = 0;
                    notifyparent();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(song[index].images),
                          radius: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          song[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          song[index].singer,
                          style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
