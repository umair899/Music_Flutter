import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Song {
  final String name;
  final String singer;
  final String images;
  final int duration;
  final Color color;

  Song(
      {required this.name,
      required this.singer,
      required this.images,
      required this.duration,
      required this.color});
}

List<Song> mostPopular = [
  Song(
      name: 'Ed Sheeran ',
      singer: 'Anti-Hero',
      images: 'assets/1.jpg',
      duration: 140,
      color: Colors.green),
  Song(
      name: 'Dua Lipa ',
      singer: 'One Kiss',
      images: 'assets/7.jpg',
      duration: 256,
      color: Colors.blue),
  Song(
      name: 'Aitch ',
      singer: 'Bamba',
      images: 'assets/4.jpeg',
      duration: 310,
      color: Colors.yellow),
  Song(
      name: 'Anne-Marie ',
      singer: 'FRIENDS',
      images: "assets/2.jpg",
      duration: 252,
      color: Colors.red),
  Song(
      name: 'Taylor Swift ',
      singer: 'Anti-Hero',
      images: 'assets/3.jpg',
      duration: 140,
      color: Colors.green),
  Song(
    name: 'Olivia Rodrigo ',
    singer: 'happier',
    images: 'assets/5.jpg',
    duration: 152,
    color: Color.fromARGB(255, 12, 119, 141),
  ),
];
List<Song> newrelease = [
  Song(
      name: 'Olivia Rodrigo ',
      singer: 'happier',
      images: 'assets/5.jpg',
      duration: 152,
      color: Colors.white),
  Song(
      name: 'Aitch ',
      singer: 'Bamba',
      images: 'assets/4.jpeg',
      duration: 310,
      color: Colors.yellow),
  Song(
      name: 'The Weeknd',
      singer: 'I Was Never There',
      images: 'assets/6.jpg',
      duration: 198,
      color: Colors.red),
  Song(
      name: 'Aitch ',
      singer: 'Bamba',
      images: 'assets/4.jpeg',
      duration: 310,
      color: Colors.yellow),
  Song(
      name: 'Dua Lipa ',
      singer: 'One Kiss',
      images: 'assets/7.jpg',
      duration: 256,
      color: Colors.blue),
  Song(
      name: 'Aitch ',
      singer: 'Bamba',
      images: 'assets/4.jpeg',
      duration: 310,
      color: Colors.yellow),
  Song(
      name: 'Olivia Rodrigo ',
      singer: 'happier',
      images: 'assets/5.jpg',
      duration: 152,
      color: Colors.white),
  Song(
      name: 'The Weeknd',
      singer: 'I Was Never ',
      images: 'assets/6.jpg',
      duration: 198,
      color: Colors.red),
];
