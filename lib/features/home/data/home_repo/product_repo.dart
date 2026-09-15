import 'dart:developer';

import 'package:pocket_base_app/core/network/pocketbase_client.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/product_model.dart';

class ProductRepo {
  final PocketBase pb = PocketBaseService.pb;

  Future<List<ProductModel>> getProducts() async {
  try {
    final result = await pb.collection('products').getList(
      page: 1,
      perPage: 50,
      sort: '-created',
      expand: 'category',
    );

    return result.items
        .map(
          (record) => ProductModel.fromRecord(record),
        )
        .toList();
  } catch (e) {
    log('Error fetching products: $e');
    rethrow;
  }
}
 Future<List<ProductModel>> getProductsByCategory(
  String categoryId,
) async {
  try {
    final result = await pb.collection('products').getList(
      page: 1,
      perPage: 50,
      filter: 'category = "$categoryId"',
      sort: '-created',
      expand: 'category',
    );

    return result.items
        .map(
          (record) => ProductModel.fromRecord(record),
        )
        .toList();
  } catch (e) {
    rethrow;
  }
}
}
