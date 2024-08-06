
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChoiceItemListRow extends StatefulWidget {
  const ChoiceItemListRow({super.key});

  @override
  State<ChoiceItemListRow> createState() => _ChoiceItemListRowState();
}

class _ChoiceItemListRowState extends State<ChoiceItemListRow> { 

int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                onTap: (){
                      setState(() {
                  if (selectedIndex == index) {
                    selectedIndex = -1;
                  } else {
                    selectedIndex = index;
                  }
                });
                },
                child: ChoiceItemRow(color: Color(0xffE2CC98),  isSelected: selectedIndex == index,)),
            );
               
          }),
    );
  }
}



class ChoiceItemRow extends StatelessWidget {
  const ChoiceItemRow({
    super.key, this.color, required this.isSelected,
  });
final Color? color ;
final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
         border: isSelected
            ? Border.all(
                color: const Color.fromARGB(255, 87, 65, 193),
                width: 2,
              )
            : Border.all(width: 0),
    
      ),
    );
  }
}