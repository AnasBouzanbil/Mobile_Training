import 'package:dribbblerandom/Components/NeuBox.dart';
import 'package:dribbblerandom/Models/PLaylistProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class
SongspLayer extends StatefulWidget {

  const SongspLayer({super.key});

  @override
  State<SongspLayer> createState() => _SongspLayerState();
}

class _SongspLayerState extends State<SongspLayer> {
  Color _color = Colors.white;
  double _currentSliderValue = 30; // Initial slider value

  @override
  Widget build(BuildContext context) {
    return  Consumer<PLayListProvider>(
      builder: (context, value , child) {

        final playlist = value.playlist;
        final currentsong = playlist[value.currentsong ?? 0];




        return Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .surface,
          body: SafeArea(

            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 25, top: 10),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back)),


                        Text("P L A Y L I S T "),


                        IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                      ]
                  ),
                  Neubox(child: Column(
                    children: [
                      ClipRRect(
                          child: Image.asset(currentsong.albumeImagePath)),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(currentsong.songName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                                Text(currentsong.artistName),
                              ],
                            ),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.favorite,
                              color: _color,
                            ))
                          ],
                        ),
                      )
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("00:00"),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.shuffle)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.repeat)),
                            Text("03.45"),
                          ],
                        ),

                        Slider(
                          min: 0,
                          max: 100,
                          value: _currentSliderValue,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 13,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: GestureDetector(
                              onTap: () {},
                              child: Neubox(child: Icon(Icons.skip_previous)),
                            )),

                            SizedBox(width: 25,),
                            Expanded(
                                flex: 2,
                                child: GestureDetector(

                                  onTap: () {

                                  },
                                  child: Neubox(child: Icon(Icons.play_arrow)),
                                )),

                            SizedBox(width: 25,),
                            Expanded(child: GestureDetector(
                              onTap: () {},
                              child: Neubox(child: Icon(Icons.skip_next)),
                            )),


                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
