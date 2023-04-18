import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_tasks/providers/lang_provider.dart';
import 'package:todo_tasks/shared_preferences/shared_preferences.dart';
import 'Views/Screens/splash_screen.dart';
/// AppLocalizations.of(context)!.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Shared Preferences
  await SharedPreferencesController().initSharedPreferences();

  /// App
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LangProviders>(
          create: (context) => LangProviders(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            home: const SplashScreen(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            locale: Locale(Provider.of<LangProviders>(context).lang_),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
