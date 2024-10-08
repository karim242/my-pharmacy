import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/cart/presentation/cubit/cart_cubit.dart';

import '../cubit/cart_state.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //المفروض هنا بعد منضيف data ف cart نستقبلها هنا للعرض
 var cubit =  BlocProvider.of<CartCubit>(context);
  return BlocConsumer<CartCubit, CartState>(
      listener: (BuildContext context, CartState state) {  
        if (state is CartUpdated) {
          // قم بإعادة تحميل البيانات في الـ UI عند وصول الحالة CartUpdated
          cubit.loadCartItems(); 
        }
      },
      builder: (context, state) {
        if (state is CartLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.network(state.items[index].productImage),
                title: Text(state.items[index].productName),
                subtitle: Text('${state.items[index].price} EGP'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, color: AppColors.primaryColor),
                      onPressed: () {
                        cubit.incrementQuantity(
                          state.items[index].productId, 
                          state.items[index].selectedQuantity
                        );
                      },
                    ),
                    Text(state.items[index].selectedQuantity.toString(),
                        style: TextStyles.textStyle14),
                    IconButton(
                      icon: const Icon(Icons.remove, color: AppColors.primaryColor),
                      onPressed: () {
                        cubit.decrementQuantity(
                          state.items[index].productId, 
                          state.items[index].selectedQuantity
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data found'));
        }
      },
    );
  }
}