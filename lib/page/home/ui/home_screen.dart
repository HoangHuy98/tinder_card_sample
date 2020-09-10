import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tinder_sample/data/database/app_database.dart';
import 'package:flutter_tinder_sample/page/favorite_list_screen/bloc/favorite_list_bloc.dart';
import 'package:flutter_tinder_sample/page/favorite_list_screen/ui/favorite_list_screen.dart';
import 'package:flutter_tinder_sample/page/tinder_list_screen/bloc/tinder_list_bloc.dart';
import 'package:flutter_tinder_sample/page/tinder_list_screen/ui/tinder_list_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    loadDatabase();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: _currentIndex == 0
              ? BlocProvider(
                  create: (context) =>
                      TinderListBloc()..add(TinderListInitListCardEvent()),
                  child: TinderListScreen())
              : BlocProvider(
                  create: (context) =>
                      FavoriteListBloc()..add(FavoriteListInitListCardEvent()),
                  child: FavoriteListScreen())),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text("Tinder List User")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite")),
        ],
        currentIndex: _currentIndex,
        onTap: (int nextPage) {
          _currentIndex = nextPage;
          setState(() {});
        },
      ),
    );
  }

  void loadDatabase() async {
    await AppDatabase.initDatabase();
  }
}
