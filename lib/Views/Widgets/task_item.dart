import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key, required this.isDone, required this.title}) : super(key: key);
  final bool isDone ;
  final String title;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          vertical: 22.h,
          horizontal: 22.w,
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(209, 224, 224, 0.2),
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
            ),
            isDone
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 27,
                  )
                : const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 27,
                  ),
          ],
        ),
      ),
    );
  }
}
