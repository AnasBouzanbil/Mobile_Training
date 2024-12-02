import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAkhkarez extends StatelessWidget {
  final String category;
  ShowAkhkarez(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 243, 243),  // Lighter teal background for consistency
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[700],  // Updated to teal
        title: Text(
          category,
          style: GoogleFonts.amiri(
            fontSize: 26, // Slightly increased for better visibility
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return switch (state) {
            CategoriesContentLoading() => Center(child: CircularProgressIndicator()),
            CategoriesContentLoaded() => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                itemCount: state.content.length,
                itemBuilder: (context, index) {
                  final item = state.content[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Card(
                      color: Colors.teal[50],  // Matching the teal background color for cards
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // Rounded corners for the cards
                      ),
                      elevation: 4, // Slight shadow for better visual depth
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  item['text'] ?? 'No content available',
                                  style: GoogleFonts.amiri(
                                    fontSize: 18, // Optimized for readability
                                    fontWeight: FontWeight.w600, // Slightly lighter weight for a smoother feel
                                    color: Colors.teal[700], // Darker teal to match the theme
                                  ),
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 10),
                              if (item['description'] != null && item['description'].isNotEmpty)
                                Center(
                                  child: Text(
                                    item['description'] ?? "",
                                    style: GoogleFonts.amiri(
                                      fontSize: 16, // Optimized size for descriptions
                                      fontWeight: FontWeight.w400, // Light weight for the description
                                      color: Color.fromARGB(255, 223, 189, 138), // Soft brown for descriptions
                                    ),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CategoriesContentError() => Center(
              child: Text(
                "Error loading content",
                style: GoogleFonts.amiri(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ),
            _ => Container(
              color: Colors.red,
              child: Center(
                child: Text("Unexpected Error", style: GoogleFonts.amiri(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          };
        },
      ),
    );
  }
}
