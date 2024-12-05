import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DuaCard extends StatefulWidget {
  const DuaCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  State<DuaCard> createState() => _DuaCardState();
}

class _DuaCardState extends State<DuaCard> {
  var i = 0;
  Color color = Colors.teal[700]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(),
        _buildCounter(),
      ],
    );
  }

  Widget _buildCard() {
    return Card(
      color: Colors.teal[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextContent(),
              const SizedBox(height: 10),
              _buildDescription(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Center(
      child: Text(
        widget.item['text'] ?? 'No content available',
        style: GoogleFonts.amiri(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.teal[700],
        ),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription() {
    if (widget.item['description'] != null && widget.item['description'].isNotEmpty) {
      return Center(
        child: Text(
          widget.item['description'] ?? "",
          style: GoogleFonts.amiri(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 223, 189, 138),
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container();
  }

  Widget _buildCounter() {
    return GestureDetector(
      onTap: () {
        final count = widget.item['count'];
        final parsedCount = count is int ? count : int.tryParse(count.toString()) ?? 1;

        if (i < parsedCount) {
          setState(() {
            i++;
          });
          if (i == parsedCount) {
            color = const Color.fromARGB(255, 1, 194, 171);
          }
        } else {
          setState(() {
            color = const Color.fromARGB(255, 1, 194, 171);
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$i",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  " / ${widget.item['count']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
