import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_state.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: CategoryItem(category: category),
                );
              },
            ),
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No categories found'));
        }
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          RoutesNames.kCategoryView,
          extra: category,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              category.imageUrl ?? "",
              fit: BoxFit.fill,
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyle11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
