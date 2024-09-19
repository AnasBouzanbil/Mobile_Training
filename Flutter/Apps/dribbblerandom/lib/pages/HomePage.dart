import 'package:dribbblerandom/Components/Drawer.dart';
import 'package:dribbblerandom/Components/NeuBox.dart';
import 'package:dribbblerandom/Models/Music.dart';
import 'package:dribbblerandom/Models/PLaylistProvider.dart';
import 'package:dribbblerandom/pages/Search.dart';
import 'package:dribbblerandom/pages/SongsList.dart';
import 'package:dribbblerandom/pages/SongsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _count = 0;
  late final PLayListProvider playlistprovider;
  late List<Widget> _listWi;

  @override
  void initState() {
    super.initState();

    // Access the playlistprovider here
    playlistprovider = Provider.of<PLayListProvider>(context, listen: false);

    // Initialize _listWi here, after playlistprovider is available
    _listWi = [
      MusicListWidget(),
      FavMusicListWidget(),
      SongspLayer(value: playlistprovider.playlist),  // You can pass the playlist here
    ];
  }

  void goToSong(List<Music> songList, int index) {
    playlistprovider.currentSongIndex = index;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongspLayer(value: songList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PLAY LIST',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: _listWi[_count], // Displays the current tab's widget
      bottomNavigationBar: CurvedNavigationBar(
        index: _count,
        height: 60.0,
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            _count = index;
          });
        },
        items: [
          Icon(Icons.music_note, size: 30),
          Icon(Icons.favorite_border, size: 30),
          Icon(Icons.play_circle),
        ],
      ),
    );
  }
}


class MusicListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neubox(
      child: Consumer<PLayListProvider>(builder: (context, value, index) {
        final List<Music> playList = value.playlist;
        return ListView.builder(
          itemBuilder: (context, index) {
            final song = playList[index];
            return ListTile(
              title: Text(song.songName),
              subtitle: Text(song.artistName),
              onTap: () {
                final playlistprovider = Provider.of<PLayListProvider>(context, listen: false);
                playlistprovider.currentSongIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongspLayer(value: playList)),
                );
              },
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(
                  song.albumeImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          itemCount: playList.length,
        );
      }),
    );
  }
}


class FavMusicListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PLayListProvider>(builder: (context, value, index) {
      final List<Music> favList = value.listFav;
      return ListView.builder(
        itemBuilder: (context, index) {
          final song = favList[index];
          return ListTile(
            title: Text(song.songName),
            subtitle: Text(song.artistName),
            onTap: () {
              final playlistprovider = Provider.of<PLayListProvider>(context, listen: false);
              playlistprovider.currentSongIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongspLayer(value: value.listFav)),
              );
            },


            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                song.albumeImagePath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: favList.length,
      );
    });
  }
}
