import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/home/data/home_repo/product_repo.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/product%20cubit/product_cubit.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/product%20cubit/product_state.dart';
import 'package:pocket_base_app/features/home/presentation/views/widgets/product_card.dart';


class CategoryProductsView extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const CategoryProductsView({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(
        productRepo: ProductRepo(),
      )..getProductsByCategory(categoryId),
      child: Scaffold(
        backgroundColor:
            Colors.grey.shade100,
        appBar: AppBar(
          title: Text(categoryName),
        ),
        body: BlocBuilder<
            ProductCubit,
            ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }

            if (state is ProductFailure) {
              return Center(
                child: Text(state.error),
              );
            }

            if (state is ProductSuccess) {
              if (state.products.isEmpty) {
                return const Center(
                  child: Text(
                    'No Products Found',
                  ),
                );
              }

              return GridView.builder(
                padding:
                    const EdgeInsets.all(16),
                itemCount:
                    state.products.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .68,
                ),
                itemBuilder:
                    (context, index) {
                  return ProductCard(
                    product:
                        state.products[index],
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}