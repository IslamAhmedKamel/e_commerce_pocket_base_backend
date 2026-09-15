import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/cat/category_cubit.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/cat/category_state.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/product%20cubit/product_cubit.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/product%20cubit/product_state.dart';
import 'package:pocket_base_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:pocket_base_app/features/home/presentation/views/widgets/product_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'My Store',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductCubit>().getProducts();

          context.read<CategoryCubit>().getCategories();
        },
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'Categories',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 110,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is CategoryFailure) {
                      return Center(child: Text(state.error));
                    }

                    if (state is CategorySuccess) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];

                          return CategoryItem(category: category);
                        },
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'All Products',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state is ProductFailure) {
                  return SliverFillRemaining(
                    child: Center(child: Text(state.error)),
                  );
                }

                if (state is ProductSuccess) {
                  if (state.products.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: Text('No Products Found')),
                    );
                  }

                  return SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid.builder(
                      itemCount: state.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: .68,
                          ),
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.products[index]);
                      },
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
