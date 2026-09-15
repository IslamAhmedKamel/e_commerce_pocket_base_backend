import 'package:pocketbase/pocketbase.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String categoryId;
  final String categoryName;
  final RecordModel record;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.categoryName,
    required this.record,
  });

  factory ProductModel.fromRecord(RecordModel record) {
    final category =
        record.get<RecordModel?>('expand.category');

    return ProductModel(
      id: record.id,
      name: record.getStringValue('name'),
      description: record.getStringValue('description'),
      price: record.getDoubleValue('price'),
      image: record.getStringValue('image'),
      categoryId: record.getStringValue('category'),
      categoryName: category?.getStringValue('name') ?? '',
      record: record,
    );
  }
}