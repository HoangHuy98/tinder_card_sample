import 'package:flutter/cupertino.dart';

class TabBarIndexController with ChangeNotifier {
  int tabBarIndex = 0;

  void onChangeTabBarIndex(int newIndex) {
    tabBarIndex = newIndex;
    notifyListeners();
  }

  void swipeNewTinderCard() {
    tabBarIndex = 0;
    notifyListeners();
  }
}
