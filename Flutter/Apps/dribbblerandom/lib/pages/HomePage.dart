import 'package:dribbblerandom/Components/Drawer.dart';
import 'package:dribbblerandom/Models/Music.dart';
import 'package:dribbblerandom/Models/PLaylistProvider.dart';
import 'package:dribbblerandom/pages/SongsPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  late final dynamic playlistprovider;

  @override
  void initState() {
    super.initState();
    playlistprovider = Provider.of<PLayListProvider>(context, listen: false);
  }

  void goToSong(int index) {
    playlistprovider.currentSongIndex = index;
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SongspLayer()));

  }

  static const String routeName = '/homepage'; // Define a route name for the Homepage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
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
      body: Consumer<PLayListProvider>(builder: (context, value, index) {
        final List<Music> playList = value.playlist;
        return ListView.builder(
          itemBuilder: (context, index) {
            final song = playList[index];
            return ListTile(
              title: Text(song.songName),
              subtitle: Text(song.artistName),
              onTap: ()=>goToSong(index),
              leading: SizedBox(
                width: 50, // Set your desired width
                height: 50, // Set your desired height
                child: Image.asset(
                  song.albumeImagePath,
                  fit: BoxFit.cover, // Ensures the image covers the box evenly
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