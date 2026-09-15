import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/home/data/home_repo/product_repo.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;

  ProductCubit({required this.productRepo}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());

    try {
      final products = await productRepo.getProducts();

      emit(ProductSuccess(products: products));
    } catch (e) {
      log('Error fetching products by category: ${e.toString()}');
      emit(ProductFailure(error: e.toString()));
    }
  }

  Future<void> getProductsByCategory(String categoryId) async {
    emit(ProductLoading());

    try {
      final products = await productRepo.getProductsByCategory(categoryId);

      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductFailure(error: e.toString()));
    }
  }
}
