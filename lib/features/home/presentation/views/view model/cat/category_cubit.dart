import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/home/data/home_repo/category_repo.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    try {
      final categories = await categoryRepo.getCategories();
      emit(CategorySuccess(categories: categories));
    } catch (e) {
      emit(CategoryFailure(error: e.toString()));
    }
  }
}
