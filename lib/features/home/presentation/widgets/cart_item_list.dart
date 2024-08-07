import 'package:flutter/material.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/data/models/cart_item_model.dart';

class CartItemList extends StatefulWidget {
  const CartItemList({
    super.key,
  });

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {  
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image.asset(cartItems[index].imageUrl),
          title: Text(cartItems[index].name),
          subtitle: Text('${cartItems[index].price} EGP'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                 icon: const Icon(Icons.add,color:AppColors.primaryColor),
                onPressed: () {
                  setState(() {
                     cartItems[index].quantity++;
                  });
                },
              ),
              Text(cartItems[index].quantity.toString(),style: TextStyles.textStyle14
              ),
              IconButton(
               icon: const Icon(Icons.remove,color:AppColors.primaryColor),
        
                onPressed: () {
                  setState(() {
                     if (cartItems[index].quantity > 1) {
                      cartItems[index].quantity--;
                    }
                  
                  });
                },
              ),
            ],
          ),
          onLongPress: () {
            setState(() {
              cartItems.removeAt(index);
            });
          },
        );
      },
    );
  }
}
