import 'package:audioplayers/audioplayers.dart';
import 'package:dribbblerandom/Models/Music.dart';
import 'package:flutter/material.dart';

class PLayListProvider extends ChangeNotifier {
  final List<Music> _playList = [
    Music(albumeImagePath: "assets/images/bluelove.jpeg", artistName: "Toto", songName: "BlueLove", songPath: "assets/audio/ElGrandeToto - Blue Love.mp3"),
    Music(albumeImagePath: "assets/images/solide.jpeg", artistName: "Hassa1", songName: "Solide", songPath: "assets/audio/HASSA1 - SOLIDE.mp3"),
    Music(albumeImagePath: "assets/images/default.jpeg", artistName: "Hassa1 x FLVCK", songName: "lA bANDERA", songPath: "assets/audio/HASSA1 X @FLVCK - LA BANDERA.mp3"),
    Music(albumeImagePath: "assets/images/wsalnimsg.jpeg", artistName: "Hassa1 x FLVCK", songName: "wsalni msg", songPath: "assets/audio/HASSA1 X @FLVCK  - WSLANI MSG.mp3"),
    Music(albumeImagePath: "assets/images/default.jpeg", artistName: "SCOOL", songName: "INARA", songPath: "assets/audio/SCOOL - INARA.mp3"),
  ];

  int? _currentsong;
  List<Music> get playlist => _playList;
  int? get currentsong => _currentsong;

  bool get isPlayying => isplaying;

  set currentSongIndex(int? newIndex) {


    _currentsong = newIndex;
    if (newIndex != null)
      {
        play();
      }
    notifyListeners();
  }

  bool isplaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Constructor
  PLayListProvider() {
    _listenToDuration();
  }



  void play() async {
    if (_currentsong != null) {
      final String _path = playlist[_currentsong!].songPath;
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource(_path));
      isplaying = true;
      notifyListeners();
    }
  }

  void _listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      isplaying = false;
      notifyListeners();
    });
  }

  void pause() async {
    _audioPlayer.pause();
    isplaying = false;
    notifyListeners();
  }

  void resume() async
  {
    await _audioPlayer.resume();
    isplaying = true;
    notifyListeners();
  }
  void PauseOrResume() async
  {
    if (isplaying)
      {
        pause();
      }
    else  {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration _dur) async
  {
    await _audioPlayer.seek(_dur);
    notifyListeners();
  }
  void PlayNext(){
    if (_currentsong != null)
      {
        if (_currentsong! < _playList.length-1)
          {
            _currentsong = _currentsong! + 1;
          }
        else
          _currentsong = 0;
      }
  }
  void PlayPrevious() async {
    if (currentDuration.inSeconds > 10)
      {

      }
    else
      {
        if (_currentsong! > 0)
          {
            _currentsong = _currentsong! - 1;
          }
        else
          {
            _currentsong = _playList.length - 1;
          }
      }
  }
}
