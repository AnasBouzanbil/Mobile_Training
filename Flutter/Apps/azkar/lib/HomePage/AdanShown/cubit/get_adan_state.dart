part of 'get_adan_cubit.dart';

@immutable
abstract class GetAdanState {}

class GetAdanInitial extends GetAdanState {}

class GetAdanLoaded extends GetAdanState {
  final Map<String, dynamic> timings;
  

  GetAdanLoaded(this.timings)  ;
}



class GetAdanError extends GetAdanState {
  final String message;

  GetAdanError(this.message);
}
