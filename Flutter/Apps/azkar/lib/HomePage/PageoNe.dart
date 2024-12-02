import 'package:azkar/HomePage/AdanShown/AdanSHown.dart';
import 'package:azkar/HomePage/AdanShown/cubit/get_adan_cubit.dart';
import 'package:azkar/HomePage/cubit/featchingnewdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyDataPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DailyDataCubit()..fetchDailyData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "ذكر الله",
            style: GoogleFonts.amiri(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[700],
        ),
        body: BlocBuilder<DailyDataCubit, DailyDataState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Location Section
                         BlocProvider(
        create: (context) => GetAdanCubit()..fetchAdanTimings(),
child:                         AdanShown(),
      ),
                       
                        SizedBox(height: 20),

                        // Quran Ayah Section
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "آية من القرآن الكريم",
                            style: GoogleFonts.amiri(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(height: 16),
                        IntrinsicHeight(
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(minHeight: 100),
                            child: Card(
                              color: Colors.teal[50],
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.ayah,
                                      style: GoogleFonts.amiriQuran(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
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
                        SizedBox(height: 16),

                        // Hadith Section
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            "حديث نبوي شريف",
                            style: GoogleFonts.amiriQuran(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(height: 16),
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
                              constraints: BoxConstraints(minHeight: 100),
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
                                        color: Colors.teal[700],
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
                    ),
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return Center(child: Text("حدث خطأ: ${state.message}", style: TextStyle(color: Colors.red)));
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ShowHadithDescription extends StatelessWidget {
  final String hadithHeadline = "شرح وفوائد الحديث";
  final String hadith;
  ShowHadithDescription({required this.hadith});

  @override
  Widget build(BuildContext context) {
    final formattedHadith = hadith.replaceAll("شرح وفوائد الحديث", "");
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 227, 227),
      appBar: AppBar(
        title: Text("شرح الحديث"),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                hadithHeadline,
                style: GoogleFonts.amiri(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 20),
              Text(
                formattedHadith,
                style: GoogleFonts.amiri(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
