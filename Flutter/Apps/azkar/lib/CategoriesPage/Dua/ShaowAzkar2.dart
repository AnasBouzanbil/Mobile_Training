

import 'package:azkar/CategoriesPage/Dua/duaCards.dart';
import 'package:azkar/CategoriesPage/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowAzkar2 extends StatelessWidget {
  final Map<String, dynamic> category;

  ShowAzkar2({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 243, 243),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        title: Text(
          category["category"],
          style: GoogleFonts.amiri(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          return switch (state) {
            CategoriesContentLoading() => const Center(child: CircularProgressIndicator()),
            DuaContentLoaded() => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                itemCount: category['array'].length,
                itemBuilder: (context, index) {
                  final item = category['array'][index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: DuaCard(item: item),
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
              child: Center(
                child: Text(
                  "Unexpected Error",
                  style: GoogleFonts.amiri(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          };
        },
      ),
    );
  }
}
