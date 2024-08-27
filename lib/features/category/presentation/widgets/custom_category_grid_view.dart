import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_pharmacy/features/category/presentation/widgets/category_view_item.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/all_product_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/all_product_state.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key, required this.categoryName,
  });
final String categoryName;
  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().loadProducts(categoryName);
    //context.read<ProductCubit>().loadProductsByPharmacyName(pharmacyName);
      return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
        return StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 22.h,
          crossAxisSpacing: 12.h,
          axisDirection: AxisDirection.down,
          children: List.generate(
           state.products.length,
            (index) => CategoryViewItem(
               product: state.products[index]
                ),
          ),
        );
         } else if (state is ProductLoading ) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}
