import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Show {
  String title;
  String link;
  String subtitle;
  String description;
  String image;

  Show(this.title, this.link, this.subtitle, this.image, this.description);

  @override
  String toString() {
    return 'Show{title: $title, link: $link, subtitle: $subtitle, image: $image}';
  }
}

class ex03 extends StatefulWidget {
  const ex03({super.key});

  @override
  State<ex03> createState() => _ex03State();
}

class _ex03State extends State<ex03> {
  Color _titleColor = Colors.black; // Default title color
  double size = 25;

  List<Show> showList = [
    Show(
      'Inception',
      'https://www.imdb.com/title/tt1375666/',
      '2010',
      'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_QL75_UX190_CR0,0,190,281_.jpg',
      'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.',
    ),
    Show(
      'The Matrix',
      'https://www.imdb.com/title/tt0133093/',
      '1999',
      'https://m.media-amazon.com/images/I/51EG732BV3L._AC_SY679_.jpg',
      'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.',
    ),
    Show(
      'Interstellar',
      'https://www.imdb.com/title/tt0816692/',
      '2014',
      'data:image/webp;base64,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',
      'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
    ),
    Show(
      'The Dark Knight',
      'https://www.imdb.com/title/tt0468569/',
      '2008',
      'https://m.media-amazon.com/images/I/51o2tV17RrL._AC_SY679_.jpg',
      'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.',
    ),
    Show(
      'The Shawshank Redemption',
      'https://www.imdb.com/title/tt0111161/',
      '1994',
      'https://m.media-amazon.com/images/I/71niXI3lxlL._AC_SY679_.jpg',
      'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MouseRegion(
          onEnter: (event) => _changeTitleColor(Colors.red, 20),
          onExit: (event) => _changeTitleColor(Colors.black, 25),
          child: Text(
            'by anas',
            style: TextStyle(
              color: _titleColor,
              fontSize: size,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: showList.length,
        itemBuilder: (context, index) {
          final show = showList[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      show.image,
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            show.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            show.subtitle,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            show.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _changeTitleColor(Color color, double sizee) {
    setState(() {
      _titleColor = color;
      size = sizee;
    });
  }
}
