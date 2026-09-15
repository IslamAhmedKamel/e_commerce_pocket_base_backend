
import 'package:pocket_base_app/features/home/data/models/category_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess({
    required this.categories,
  });
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure({
    required this.error,
  });
}