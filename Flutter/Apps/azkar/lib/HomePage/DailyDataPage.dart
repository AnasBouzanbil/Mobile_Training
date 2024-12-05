
/// ******************************************************************************
///  Created By: Anas Bouzanbil
///  At time of creation: [Specify date/time here]
///  Last time modified: [Specify last modification date/time here]
///  Explaining: This widget manages the display of daily data, including a Quran
///  Ayah, a Hadith, and Adan timings. It fetches and renders this data using 
///  Bloc state management, ensuring a clean and responsive UI.
///******************************************************************************

import 'package:azkar/HomePage/AdanShown/AdanSHown.dart';
import 'package:azkar/HomePage/AdanShown/cubit/get_adan_cubit.dart';
import 'package:azkar/HomePage/ShowHadithDescription.dart';
import 'package:azkar/HomePage/cubit/featchingnewdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

const Color customTealColor = Color(0xFF00796B);

class DailyDataPage extends StatelessWidget {
  const DailyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DailyDataCubit, DailyDataState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("حدث خطأ: ${state.message}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const LoadingView();
        } else if (state is LoadedState) {
          return LoadedView(state: state);
        }
        return const SizedBox();
      },
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "ذكر الله",
        style: GoogleFonts.amiri(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: customTealColor,
    );
  }
}

class LoadedView extends StatelessWidget {
  final LoadedState state;

  const LoadedView({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAdanSection(),
              const SizedBox(height: 20),
              _buildQuranAyahSection(),
              const SizedBox(height: 16),
              _buildHadithSection(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "ذكر الله",
        style: GoogleFonts.amiri(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: customTealColor,
    );
  }

  Widget _buildAdanSection() {
    return BlocProvider(
      create: (context) => GetAdanCubit()..fetchAdanTimings(),
      child:  AdanShown(),
    );
  }

  Widget _buildQuranAyahSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSectionTitle("آية من القرآن الكريم"),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 100),
            child: Card(
              color: Colors.teal[50],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.ayah,
                      style: GoogleFonts.amiriQuran(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "سورة: ${state.surah} - آية رقم: ${state.ayahNumber}",
                      style: GoogleFonts.amiri(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHadithSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildSectionTitle("حديث نبوي شريف"),
        const SizedBox(height: 16),
        IntrinsicHeight(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowHadithDescription(hadith: state.description),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 100),
              child: Card(
                color: Colors.teal[50],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Text(
                      state.hadith,
                      style: GoogleFonts.amiri(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: customTealColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.topRight,
      child: Text(
        title,
        style: GoogleFonts.amiri(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
