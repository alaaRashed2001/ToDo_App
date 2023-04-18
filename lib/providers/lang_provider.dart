import 'package:flutter/cupertino.dart';
import 'package:todo_tasks/shared_preferences/shared_preferences.dart';

class LangProviders extends ChangeNotifier {
  String lang_ = SharedPreferencesController().getLanguage;

  Future<void> changeLanguage() async {
    lang_ == 'ar' ? lang_ = 'en' : lang_ = 'ar';

    /// if( lang_ == 'ar'){
    /// lang_ = 'en'
    /// }else{
    /// lang_ = 'ar'
    /// }
    await SharedPreferencesController().setLanguage(lang_);
    notifyListeners();
  }
}
