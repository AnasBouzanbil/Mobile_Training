import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // Ensure you import this package
import 'package:dribbblerandom/Models/Music.dart';

class PLayListProvider extends ChangeNotifier {
  final List<Music> _playList = [
    Music(albumeImagePath: "assets/images/bluelove.jpeg", artistName: "Toto", songName: "BlueLove", songPath: "assets/audio/ElGrandeToto - Blue Love.mp3"),
    Music(albumeImagePath: "assets/images/solide.jpeg", artistName: "Hassa1", songName: "Solide", songPath: "assets/audio/HASSA1 - SOLIDE.mp3"),
    Music(albumeImagePath: "assets/images/default.jpeg", artistName: "Hassa1 x FLVCK", songName: "LA BANDERA", songPath: "assets/audio/HASSA1 X @FLVCK - LA BANDERA.mp3"),
    Music(albumeImagePath: "assets/images/wsalnimsg.jpeg", artistName: "Hassa1 x FLVCK", songName: "wsalni msg", songPath: "assets/audio/HASSA1 X @FLVCK  - WSLANI MSG.mp3"),
    Music(albumeImagePath: "assets/images/default.jpeg", artistName: "SCOOL", songName: "INARA", songPath: "assets/audio/SCOOLINARA.mp3"),
    Music(albumeImagePath: "assets/images/majatech.jpeg", artistName: "Faycel seghir", songName: "Majatech fi bali", songPath: "assets/audio/Cheb Bilal Sghir - Majatech Fi Bali.mp3"),

  ];

  final List<Albumes>  _albumes = [

  ];



  List<Music> _listFav = [
  ];
  int? _currentSongIndex;
  bool _isPlaying = false;

  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  List<Music> get listFav => _listFav;
  List<Music> get playlist => _playList;
  int? get currentSongIndex => _currentSongIndex;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;

  Icon get playPauseIcon {
    return _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow);
  }

  PLayListProvider() {
    _listenToDuration();
  }

  void play() async {
    if (_currentSongIndex == null) return;

    final String path = playlist[_currentSongIndex!].songPath;

    try {
      await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse('asset:///$path')));
      await _audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void _listenToDuration() {
    _audioPlayer.durationStream.listen((newDuration) {
      _totalDuration = newDuration ?? Duration.zero;
      notifyListeners();
    });

    _audioPlayer.positionStream.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((playerState) {
      _isPlaying = playerState.playing;
      notifyListeners();
    });
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> resume() async {
    await _audioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }


  void pauseOrResume() async {
    if (_isPlaying) {
      await pause();
    } else {
      await resume();
    }
  }

  void seek(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  void playNext() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playList.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        _currentSongIndex = 0;
      }
      play();
      notifyListeners();
    }
  }

  void playPrevious() {
    if (_currentSongIndex != null) {
      if (_currentDuration.inSeconds > 10) {
        seek(Duration.zero);
      } else {
        if (_currentSongIndex! > 0) {
          _currentSongIndex = _currentSongIndex! - 1;
        } else {
          _currentSongIndex = _playList.length - 1;
        }
        play();
        notifyListeners();
      }
    }
  }

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

  void addFavorite(Music music) {
    if (!_listFav.contains(music)) {
      _listFav.add(music);
      _updateMusicLovedStatus(music, true, Colors.red);
      notifyListeners();
    }
  }

  void removeFavorite(Music music) {
    if (_listFav.contains(music)) {
      _listFav.remove(music);
      _updateMusicLovedStatus(music, false, Colors.white);
      notifyListeners();
    }
  }

  void _updateMusicLovedStatus(Music music, bool isLoved, Color _col) {
    final index = _playList.indexWhere((item) => item == music);
    if (index != -1) {
      _playList[index].color = _col;
      _playList[index].isitLoved = isLoved;
    }
  }
}
