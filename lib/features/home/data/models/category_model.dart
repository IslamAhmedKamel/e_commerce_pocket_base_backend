import 'package:pocketbase/pocketbase.dart';

class CategoryModel {
  final String id;
  final String name;
  final String image;
  final RecordModel record;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.record,
  });

  factory CategoryModel.fromRecord(RecordModel record) {
    return CategoryModel(
      id: record.id,
      name: record.getStringValue('name'),
      image: record.getStringValue('image'),
      record: record,
    );
  }
}
