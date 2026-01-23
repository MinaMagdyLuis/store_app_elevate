import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_elevate/core/data/model/product.dart';
import 'package:store_app_elevate/ui/home_screen/home_screen_view_model.dart';
import 'package:store_app_elevate/ui/home_screen/product_item_widget.dart';
import 'package:store_app_elevate/ui/utils/app_colors.dart';

import '../../core/domain/di/di.dart';
import '../utils/base_state.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModelCubit>(
      create: (_) => getIt<HomeViewModelCubit>()..loadProducts(),
      child: const _HomeView(),
    );
  }
}
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          "Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<HomeViewModelCubit, BaseState>(
        builder: (context, state) {
          if (state is BaseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BaseErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is BaseSuccessState<List<Product>>) {
            return ProductsGrid(products: state.data!);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  const ProductsGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
