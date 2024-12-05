import 'package:azkar/AzkarPage/cubit/asmaa_allah_cubit.dart';
import 'package:azkar/AzkarPage/cubit/asmaa_allah_state.dart';
import 'package:azkar/AzkarPage/models/name_of_allah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AsmaaAllahWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AsmaaAllahCubit()..fetchNamesOfAllah(),
      child: Scaffold(
        appBar: AppBar(
                  backgroundColor: Colors.teal[700],  // Updated to teal

          title: const Text('أسماء الله الحسنى',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 25,
              color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AsmaaAllahCubit, AsmaaAllahState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.namesOfAllah.length,
                itemBuilder: (context, index) {
                  final nameOfAllah = state.namesOfAllah[index];
                  return GestureDetector(
                    
                    onTap: () => _showDescriptionDialog(context, nameOfAllah),
                    child: Card(              
                      color: Colors.teal[100],
                      child: Center(
                        child: Text(
                          nameOfAllah.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('Unknown State'));
            }
          },
        ),
      ),
    );
  }

  void _showDescriptionDialog(BuildContext context, NameOfAllah nameOfAllah) {
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[50], // Light teal background for the dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      title: Text(
        nameOfAllah.name,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontFamily: 'Amiri', // Custom font
          fontSize: 22, // Slightly larger font for the title
          fontWeight: FontWeight.bold, // Make the title bold
          color: Colors.teal[700], // Dark teal color for title
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          nameOfAllah.text,
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 18,
            color: Colors.black87, // Darker text for content
            height: 1.5, // Increase line height for better readability
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'حسنا',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 18,
              color: Colors.teal[700], // Matching color with title
            ),
          ),
        ),
      ],
    );
  },
);

  }
}
