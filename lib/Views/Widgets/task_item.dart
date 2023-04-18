import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key}) : super(key: key);

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
              'data',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
              ),
            ),
            const Icon(
              Icons.close,
              color: Colors.red,
              size: 27,
            )
          ],
        ),
      ),
    );
  }
}
