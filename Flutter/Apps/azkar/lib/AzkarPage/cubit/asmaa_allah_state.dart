
import 'package:azkar/AzkarPage/models/name_of_allah.dart';

abstract class AsmaaAllahState {}

class LoadingState extends AsmaaAllahState {}

class LoadedState extends AsmaaAllahState {
  final List<NameOfAllah> namesOfAllah;

  LoadedState(this.namesOfAllah);
}

class ErrorState extends AsmaaAllahState {
  final String message;

  ErrorState(this.message);
}
