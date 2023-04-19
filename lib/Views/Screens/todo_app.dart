import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../Models/task_model.dart';
import '../../providers/lang_provider.dart';
import '../Widgets/task_item.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late TextEditingController taskEditingController;
  @override
  void initState() {
    taskEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    taskEditingController.dispose();
    super.dispose();
  }

  List allTasks = [
    TaskModel(title: 'Call Mom', status: true),
    TaskModel(title: 'GEM', status: true),
  ];
  addNewTasks() {
    setState(() {
      allTasks.add(TaskModel(title: taskEditingController.text, status: false));
    });
  }

  int calculateCompletedTasks() {
    int completedTasks = 0;

    for (var item in allTasks) {
      if (item.status) {
        completedTasks++;
      }
    }

    return completedTasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(58, 66, 86, 1),
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 27),
              child: Text(
                '${calculateCompletedTasks()}/${allTasks.length}',
                style: TextStyle(
                    fontSize: 44.sp,
                    color:  calculateCompletedTasks() == allTasks.length ?   const Color.fromARGB(255, 142, 253, 200)  :  Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ...allTasks.map((item) => OneTask(
                  title: item.title,
                  isDone: item.status,
                ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.amber[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            context: context,
            builder: (context) => Padding(
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
                          controller: taskEditingController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.addNewTask,
                          ),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        TextButton(
                          onPressed: () {
                            addNewTasks();
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.add,
                            style: TextStyle(fontSize: 22.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
