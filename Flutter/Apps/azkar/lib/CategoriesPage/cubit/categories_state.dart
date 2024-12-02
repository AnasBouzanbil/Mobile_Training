part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {
  final List<String> categories;
  CategoriesLoading(this.categories);
}

final class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  CategoriesLoaded(this.categories);
}

final class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

final class CategoriesContentLoading extends CategoriesState {
  final String category;
  CategoriesContentLoading(this.category);
}

final class CategoriesContentLoaded extends CategoriesState {
  final List<Map<String, dynamic>> content;
  CategoriesContentLoaded(this.content);
}

final class CategoriesContentError extends CategoriesState {
  final String message;
  CategoriesContentError(this.message);
}
