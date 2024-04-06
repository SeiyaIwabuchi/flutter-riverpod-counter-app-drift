import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWrapper {

  // ----
  //

  static late Future<SharedPreferences> prefs;

  static SharedPreferencesWrapper? prefsw;

  //

  SharedPreferencesWrapper._() {
    prefs = SharedPreferences.getInstance();
    prefsw = this;
  }


  // ----
  //


  static SharedPreferencesWrapper getInstance() {
    if (prefsw == null) {
      return SharedPreferencesWrapper._();
    } else {
      return SharedPreferencesWrapper.prefsw!;
    }
  }


  // ----
  //

  Future<int> getInt(Enum elem) async {
    int? nullable = await getIntOrNull(elem);
    if (nullable == null) {
      throw Exception("読み込んだ値がnull");
    }

    return nullable;
  }

  Future<int?> getIntOrNull(Enum elem) async {
    return (await prefs).getInt(elem.name);
  }

  void setInt(Enum elem, int value) async {
    (await prefs).setInt(elem.name, value);
  }
}