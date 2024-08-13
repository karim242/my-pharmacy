import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_pharmacy/core/routes/routes_names.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/category_model.dart';
import 'package:my_pharmacy/features/home/presentation/cubit/home_cubit.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});
  @override
  Widget build(BuildContext context) {
  // context.read<HomeCubit>().loadCategories();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if(state is HomeCategoriesSuccessState)
        {
        return  SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                      onTap: () {
                        // Add your onTap action here
                        GoRouter.of(context).push(RoutesNames.kCategoryView);
                      },
                      child:  CategoryItem(categories: state.categories[index],)),
                );
              }),
        );
        }
        else if(state is HomeCategoriesLoadingState){

          return const Center(child: CircularProgressIndicator());

        }else{
          
         return SizedBox(
                      child: Text('no Data found'),

         );
        }
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categories});
final CategoryModel categories;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
              categories.imageUrl?? "", // Replace with your image path
              fit: BoxFit.fill,
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
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                   categories.name,
                    textAlign: TextAlign.center,
                    style: TextStyles.textStyle11,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
