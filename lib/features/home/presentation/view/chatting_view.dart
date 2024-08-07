import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pharmacy/core/utils/app_colors.dart';
import 'package:my_pharmacy/core/utils/text_styles.dart';
import 'package:my_pharmacy/features/home/presentation/widgets/active_chat_box.dart';

class ChattingView extends StatefulWidget {
  const ChattingView({super.key});

  @override
  State<ChattingView> createState() => _ChattingViewState();
}

class _ChattingViewState extends State<ChattingView> {
  final _controller = ScrollController();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'صيدلية الطرشوبي',
          style: TextStyles.textStyle20,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ActiveChattingBox();
                    // const InActiveChattingBox();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                 const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4),
                    child:  Icon(
                      Icons.image,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                    width: 228.w,
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        controller.clear();
                        _controller.animateTo(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      decoration: InputDecoration(
                        hintText: ' اكتب رسالتك',
                        filled: true,
                        contentPadding: EdgeInsets.all(4),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: AppColors.primaryColor,
                      child: const Icon(
                        Icons.send,
                        size: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
