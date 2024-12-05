import 'package:azkar/core/json_loader.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepository {
  Future<Either<dynamic, List<String>>> loadCategories() async {
    try {
      final categories = await JsonLoader().loadJson();
      return Right(categories.keys.toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<dynamic, List<Map<String, dynamic>>>> loadCategoriesContent(String category) async {
    try {
      final categories = await JsonLoader().loadJson();
      if (categories.containsKey(category)) {
        var categoryContent = categories[category];
        if (categoryContent is List) {
          return Right(List<Map<String, dynamic>>.from(categoryContent));
        } else {
          return const Left('Content format is invalid');
        }
      } else {
        return const Left('Category not found');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

Future<Either<dynamic, List<Map<String, dynamic>>>> loadDua() async {
  try {
    final data = await JsonLoader().loadJsonDua();
    final list = data.whereType<Map<String, dynamic>>().toList();
    return Right(list);
    } catch (e) {
    return Left(e.toString());
  }
}

}


