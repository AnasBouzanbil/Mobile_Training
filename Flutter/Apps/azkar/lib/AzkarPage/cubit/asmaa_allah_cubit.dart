// lib/AzkarPage/cubit/asmaa_allah_cubit.dart

import 'dart:convert';
import 'package:azkar/AzkarPage/models/name_of_allah.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'asmaa_allah_state.dart';

class AsmaaAllahCubit extends Cubit<AsmaaAllahState> {
  AsmaaAllahCubit() : super(LoadingState());

  Future<void> fetchNamesOfAllah() async {
    emit(LoadingState());
    try {
      final namesJson = await rootBundle.loadString('assets/NamesOfAllah.JSON');
      final List<dynamic> namesList = jsonDecode(namesJson);
      final List<NameOfAllah> names = namesList.map((json) => NameOfAllah.fromJson(json)).toList();
      emit(LoadedState(names));
    } catch (e) {
      emit(ErrorState("Failed to fetch Names of Allah: $e"));
    }
  }
}
