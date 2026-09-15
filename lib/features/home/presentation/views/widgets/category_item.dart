import 'package:flutter/material.dart';

import 'package:pocket_base_app/core/network/pocketbase_client.dart';
import 'package:pocket_base_app/features/home/data/models/category_model.dart';
import 'package:pocket_base_app/features/home/presentation/views/widgets/cat.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = category.image.isNotEmpty
        ? PocketBaseService.pb.files
            .getURL(
              category.record,
              category.image,
            )
            .toString()
        : '';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryProductsView(
              categoryId: category.id,
              categoryName: category.name,
            ),
          ),
        );
      },
      child: Container(
        width: 85,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey.shade200,
              child: ClipOval(
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,

                        loadingBuilder: (
                          context,
                          child,
                          loadingProgress,
                        ) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const SizedBox(
                            width: 64,
                            height: 64,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        },

                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          debugPrint(
                            'CATEGORY IMAGE URL: $imageUrl',
                          );

                          debugPrint(
                            'CATEGORY IMAGE ERROR: $error',
                          );

                          return const SizedBox(
                            width: 64,
                            height: 64,
                            child: Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox(
                        width: 64,
                        height: 64,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                          ),
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
