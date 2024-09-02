import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../cubit/cart_cubit.dart';
import '../widgets/cart_item_list.dart';
import '/core/routes/routes_names.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/text_styles.dart';
import '/core/widget/custom_title.dart';
import '/core/widget/text_price_row.dart';
import '/features/cart/presentation/cubit/cart_state.dart';
import '/features/home/presentation/widgets/next_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  final double deliveryService = 15;
  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().loadCartItems();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Removes the back button

        title: TitleText(
          title: AppStrings.kBuyCart(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 38.0,
          left: 38.0,
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                if (state.items.isNotEmpty) {
                  double totalPrice =
                      state.items[0].price * state.items[0].selectedQuantity;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 8),
                      Text(state.items[0].pharmacyName,
                          style: TextStyles.textStyle14.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                          )),

                      SizedBox(height: 20.h),

                      const CartItemList(),
                      SizedBox(height: 20.h),
                      TextField(
                        decoration: InputDecoration(
                          hintText: AppStrings.kWriteUMessage(context),
                          filled: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 6),
                          fillColor: AppColors.lightGrayColor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TitleText(title: AppStrings.kTotalPrice(context)),
                      SizedBox(height: 20.h),
                      TextAndPriceRow(
                          title: AppStrings.kTotalPurchases(context),
                          price: totalPrice),
                      SizedBox(height: 20.h),
                      TextAndPriceRow(
                        title: AppStrings.kDeliveryService(context),
                        price: deliveryService,
                      ),
                      SizedBox(height: 20.h),
                      TextAndPriceRow(
                        title: AppStrings.kTotal(context),
                        price: totalPrice + deliveryService,
                      ),
                      SizedBox(height: 20.h),

                      NextButton(
                        lebale: AppStrings.kNextString(context),
                        onTap: () {
                          GoRouter.of(context).push(RoutesNames.kPaymentView);
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                } else {
                  return const Center(child: Text('No item data found'));
                }
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
          ),
        ),
      ),
    );
  }
}
