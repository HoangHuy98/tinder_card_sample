import 'package:flutter/material.dart';

import '../controller/tabbar_index_controller.dart';

class TabbarTinderDetail extends StatefulWidget {
  final TabBarIndexController tabBarIndexController;

  TabbarTinderDetail(this.tabBarIndexController, {Key key}) : super(key: key);

  @override
  _TabbarTinderDetailState createState() {
    return _TabbarTinderDetailState();
  }
}

class _TabbarTinderDetailState extends State<TabbarTinderDetail> {
  int _currentTab = 0;

  @override
  void initState() {
    widget.tabBarIndexController.addListener(() {
      _currentTab = widget.tabBarIndexController.tabBarIndex;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIconItem(Icons.info, 0),
        SizedBox(
          width: 15,
        ),
        buildIconItem(Icons.calendar_today, 1),
        SizedBox(
          width: 15,
        ),
        buildIconItem(Icons.map, 2),
        SizedBox(
          width: 15,
        ),
        buildIconItem(Icons.phone, 3),
        SizedBox(
          width: 15,
        ),
        buildIconItem(Icons.lock, 4),
      ],
    );
  }

  Widget buildIconItem(IconData icon, int index) {
    bool selected = _currentTab == index;
    return GestureDetector(
      onTap: () {
        widget.tabBarIndexController.onChangeTabBarIndex(index);
      },
      child: Column(
        children: [
          selected
              ? Container(
                  width: 32,
                  child: Divider(
                    color: Colors.green,
                    thickness: 2,
                  ),
                )
              : Divider(
                  color: Colors.green,
                ),
          Icon(
            icon,
            size: 32,
            color: selected ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
