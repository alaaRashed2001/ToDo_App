import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/lang_provider.dart';
import '../Widgets/task_item.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86,1),
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.todoTask,
          style: TextStyle(
            color: Colors.white,
            fontSize: 33.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await Provider.of<LangProviders>(context, listen: false)
                    .changeLanguage();
              },
              icon: const Icon(
                Icons.language,
                size: 33,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
       itemBuilder: (context, index) => const OneTask(),
      ),
    );
  }
}
