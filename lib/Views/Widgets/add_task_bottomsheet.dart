import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 42.h,
                ),
                TextField(
                  maxLength: 20,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.addNewTask,
                  ),
                ),
                SizedBox(height: 22.h,),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.add,
                    style: TextStyle(
                      fontSize: 22.sp
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
