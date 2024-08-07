import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/app_strings.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/core/widget/custom_title.dart';
import 'package:my_pharmacy/core/widget/text_price_row.dart';
import 'package:my_pharmacy/features/home/data/models/cart_item_model.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/cart_item_list.dart';
class CartView extends StatelessWidget {
  const CartView({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
         padding: EdgeInsets.only(right: 38.0, left: 38.0, top: 70.0.h),
          child: SingleChildScrollView(
            child: Column(
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
               const  TitleText(title:AppStrings.kBuyCart),
               const    SizedBox(height: 8),
                   Text(
                     'الطرشوبي',
                     style: TextStyles.textStyle10.copyWith(
                       color: AppColors.blackColor,
                     )
                   ),
                 ],
               ),
              CartItemList(),
                SizedBox(height: 20.h),
                TextField(
                  
                   decoration: InputDecoration(
                        hintText: ' اكتب رسالتك',
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 6),
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

                TextAndPriceRow()
               
               
               
              
            ],
                    ),
          ),
      
      ),
    );
  }
}

