import 'package:flutter/material.dart';
import 'package:pocket_base_app/core/network/pocketbase_client.dart';
import 'package:pocket_base_app/features/home/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.image.isNotEmpty
        ? PocketBaseService.pb.files
            .getURL(
              product.record,
              product.image,
            )
            .toString()
        : '';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,

                        // أثناء تحميل الصورة
                        loadingBuilder: (
                          context,
                          child,
                          loadingProgress,
                        ) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },

                        // لو حصل Error
                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          debugPrint('IMAGE URL: $imageUrl');
                          debugPrint('IMAGE ERROR: $error');

                          return const Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              product.categoryName,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price} EGP',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
