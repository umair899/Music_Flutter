import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter/src/widgets/framework.dart';
 import 'package:music_flutter/home_page.dart';
 import 'package:music_flutter/widget/database.dart';

class Trackwidget extends StatelessWidget {
  final Function() notifyparent;
  Trackwidget(this.notifyparent);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: mostPopular.length,
        itemBuilder: (context, index) {
          // print("images path"+mostPopular[index].images+"paht");
          return GestureDetector(
            onTap: (() {
              currentSong = mostPopular[index];
              currentSlider = 0;
              notifyparent();
            }),
            child: Container(
              margin: EdgeInsets.all(10),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: mostPopular[index].color,
                      blurRadius: 1,
                      spreadRadius: 0.3),
                ],
                image: DecorationImage(
                    image: AssetImage(mostPopular[index].images),
                    scale: 1,
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mostPopular[index].name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 110, 102, 102)),
                    ),
                    Text(
                      mostPopular[index].singer,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 137, 130, 150)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
