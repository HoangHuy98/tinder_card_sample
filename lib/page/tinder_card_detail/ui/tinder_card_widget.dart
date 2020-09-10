import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_sample/data/local/model/tinder_user.dart';

import '../controller/tabbar_index_controller.dart';
import 'tabbar_tinder_detail_widget.dart';

class TinderCardWidget extends StatefulWidget {
  final TinderUser tinderUser;
  final TabBarIndexController tabBarIndexController;

  TinderCardWidget(this.tinderUser, this.tabBarIndexController, {Key key})
      : super(key: key);

  @override
  _TinderCardWidgetState createState() {
    return _TinderCardWidgetState();
  }
}

class _TinderCardWidgetState extends State<TinderCardWidget>
    with SingleTickerProviderStateMixin {
  double opacity = 1.0;

  @override
  void initState() {
    widget.tabBarIndexController.addListener(() {
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
    var size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0))),
                  child: Container(
                      decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.3)),
                  )),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(),
                      ),
                      Text(
                        titleTabWithIndex(
                            widget.tabBarIndexController.tabBarIndex),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 22.0),
                      ),
                      Text(
                        descriptionTabWithIndex(
                            widget.tabBarIndexController.tabBarIndex,
                            widget.tinderUser),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 36.0),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          child:
                              TabbarTinderDetail(widget.tabBarIndexController),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(width: 0.1, color: Colors.black)),
              width: size.width * 0.4,
              height: size.width * 0.4,
              margin: EdgeInsets.only(bottom: size.height * 0.35),
              padding: EdgeInsets.all(5.0),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.tinderUser.picture.medium,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String titleTabWithIndex(int tabBarIndex) {
    switch (tabBarIndex) {
      case 0:
        return "My Name is";
      case 1:
        return "My Birthday is";
      case 2:
        return "My Address is";
      case 3:
        return "My Phone is";
      case 4:
        return "My ID is";
      default:
        return "";
    }
  }

  String descriptionTabWithIndex(int tabBarIndex, TinderUser tinderUser) {
    switch (tabBarIndex) {
      case 0:
        return "${tinderUser.name.last} ${tinderUser.name.first}";
      case 1:
        return "${tinderUser.dob}";
      case 2:
        return "${tinderUser.location.street}";
      case 3:
        return "${tinderUser.phone}";
      case 4:
        return "${tinderUser.id.value}";
      default:
        return "";
    }
  }
}
