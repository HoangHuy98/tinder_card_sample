import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tinder_sample/page/tinder_card_detail/controller/tabbar_index_controller.dart';
import 'package:flutter_tinder_sample/page/tinder_card_detail/ui/tinder_card_widget.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

import '../bloc/tinder_list_bloc.dart';

class TinderListScreen extends StatefulWidget {
  TinderListScreen({Key key}) : super(key: key);

  @override
  _TinderListScreenState createState() {
    return _TinderListScreenState();
  }
}

class _TinderListScreenState extends State<TinderListScreen> {
  TabBarIndexController _tabBarIndexController = TabBarIndexController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<TinderListBloc, TinderListState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        if (state is TinderListShowCardListState) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              TinderSwapCard(
                totalNum: state.tinderUserList.length,
                maxWidth: size.width * 0.9,
                swipeEdge: 5.0,
                minWidth: size.width * 0.7,
                maxHeight: size.height * 0.8,
                minHeight: size.height * 0.6,
                orientation: AmassOrientation.RIGHT,
                allowVerticalMovement: false,
                swipeCompleteCallback:
                    (CardSwipeOrientation orientation, int index) {
                  context.bloc<TinderListBloc>().add(
                      TinderListSwipeNewCardEvent(
                          orientation, index, state.tinderUserList[index]));
                  if (orientation.index != 2) {
                    _tabBarIndexController.swipeNewTinderCard();
                  }
                },
                cardBuilder: (context, index) => TinderCardWidget(
                    state.tinderUserList[index], _tabBarIndexController),
              )
            ],
          );
        } else if (state is TinderListShowEmptyListState) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Empty",
                style: TextStyle(color: Colors.black),
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .bloc<TinderListBloc>()
                      .add(TinderListInitListCardEvent());
                  _tabBarIndexController.swipeNewTinderCard();
                },
                child: Text("Reload"),
              )
            ],
          ));
        } else {
          return Container();
        }
      },
    );
  }
}
