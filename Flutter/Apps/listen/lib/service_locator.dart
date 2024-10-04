



import 'package:get_it/get_it.dart';
import 'package:listen/data/repository/auth/Auth_Repository_impl.dart';
import 'package:listen/data/sources/auth/Firebase.auth.service.dart';
import 'package:listen/domain/repository/auth/auth.dart';

final sl = GetIt.instance;


Future<void>  initializeDepandencies() async{
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
}