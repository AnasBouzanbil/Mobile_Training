abstract class UseCase<Type, Params>{
  Future<void> call({Params param});
}