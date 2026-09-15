import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_base_app/features/home/data/home_repo/category_repo.dart';
import 'package:pocket_base_app/features/home/data/home_repo/product_repo.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/cat/category_cubit.dart';
import 'package:pocket_base_app/features/home/presentation/views/view%20model/product%20cubit/product_cubit.dart';
import 'package:pocket_base_app/features/home/presentation/views/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              CategoryCubit(categoryRepo: CategoryRepo())..getCategories(),
        ),
        BlocProvider(
          create: (_) =>
              ProductCubit(productRepo: ProductRepo())..getProducts(),
        ),
      ],
      child: const HomeBody(),
    );
  }
}
