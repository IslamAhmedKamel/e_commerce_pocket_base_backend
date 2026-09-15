import 'package:pocket_base_app/core/network/pocketbase_client.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/category_model.dart';

class CategoryRepo {
  final PocketBase pb = PocketBaseService.pb;

  Future<List<CategoryModel>> getCategories() async {
    final result = await pb
        .collection('categories')
        .getFullList(sort: 'created');

    return result.map((record) => CategoryModel.fromRecord(record)).toList();
  }
}
