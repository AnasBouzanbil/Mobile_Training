import 'package:azkar/CategoriesPage/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository repository = CategoriesRepository();
  CategoriesCubit() : super(CategoriesInitial());

  void loadCategories() async {
    emit(CategoriesLoading([]));
    final result = await repository.loadCategories();
    result.fold(
      (error) => emit(CategoriesError(error)),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }

  void LoadCategoriesContent(String category) async {
    emit(CategoriesContentLoading(category));
    final result = await repository.loadCategoriesContent(category);
    result.fold(
      (error) => emit(CategoriesContentError(error)),
      (content) => emit(CategoriesContentLoaded(content)),
    );
  }
}
