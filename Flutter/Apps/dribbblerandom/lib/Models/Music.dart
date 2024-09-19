



import 'package:flutter/material.dart';


class Music{
  final String songName;
  final String artistName;
  final String albumeImagePath;
  final String songPath;
  bool isitLoved = false;
  Color color = Colors.white;


  Music({
    required this.albumeImagePath,
    required this.artistName,
    required this.songName,
    required this.songPath
  });
}
class Albumes {
  String albumeName;
  List<Music> _listMusic = [];

  Albumes({
    required this.albumeName,
  });

  void addMusic(Music music) {
    _listMusic.add(music);
  }

  void removeMusic(Music music) {
    _listMusic.remove(music);
  }

  List<Music> get listMusic => _listMusic;
}