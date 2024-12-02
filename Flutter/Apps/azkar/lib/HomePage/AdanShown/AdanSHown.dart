import 'package:azkar/HomePage/AdanShown/cubit/get_adan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdanShown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAdanCubit, GetAdanState>(
      listener: (context, state) {
        if (state is GetAdanError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GetAdanLoaded) {
          var timings = state.timings;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        "أوقات الصلاة",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                    
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 16),
                ...timings.entries.map((entry) => _buildTimingCard(entry.key, entry.value)).toList(),
              ],
            ),
          );
        } else if (state is GetAdanError) {
          return Center(
            child: Text(
              'حدث خطأ أثناء جلب أوقات الصلاة',
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          );
        }
      },
    );
  }

  Widget _buildTimingCard(String prayerName, String timing) {
    if (prayerName.toLowerCase() == 'imsak' || prayerName.toLowerCase() == 'midnight' || prayerName.toLowerCase() == "firstthird" || prayerName.toLowerCase() == "lastthird" || prayerName.toLowerCase() == "sunset") {
      return Container();
    }
    if (prayerName.toLowerCase() == 'sunrise') {
      prayerName = 'الشروق';
    } else if (prayerName.toLowerCase() == 'dhuhr') {
      prayerName = 'الظهر';
    } else if (prayerName.toLowerCase() == 'asr') {
      prayerName = 'العصر';
    } else if (prayerName.toLowerCase() == 'maghrib') {
      prayerName = 'المغرب';
    } else if (prayerName.toLowerCase() == 'isha') {
      prayerName = 'العشاء';
    }
    else if (prayerName.toLowerCase() == 'fajr') {
      prayerName = 'الفجر';
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.teal.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              prayerName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal.shade700,
              ),
            ),
            Text(
              timing,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.brown.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}