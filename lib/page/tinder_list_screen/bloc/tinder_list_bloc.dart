import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_tinder_sample/data/local/model/tinder_user.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:meta/meta.dart';

part 'tinder_list_event.dart';

part 'tinder_list_state.dart';

class TinderListBloc extends Bloc<TinderListEvent, TinderListState> {
  TinderListBloc() : super(TinderListInitial());
  List<TinderUser> listFakeData = [];

  @override
  Stream<TinderListState> mapEventToState(
    TinderListEvent event,
  ) async* {
    if (event is TinderListInitListCardEvent) {
      listFakeData = List.generate(10, (index) {
        Map<String, dynamic> fakeData = {
          "results": [
            {
              "gender": "female",
              "name": {"title": "miss", "first": "ramona", "last": "carter"},
              "location": {
                "street": "2286 frances ct",
                "city": "townsville",
                "state": "queensland",
                "postcode": 6699
              },
              "email": "ramona.carter@example.com",
              "login": {
                "username": "bigrabbit281",
                "password": "salvador",
                "salt": "NgEKDglD",
                "md5": "8946b15e0a5411bfdb52df5ac1b90520",
                "sha1": "f460f12a714919499d413a69a76ca2f262e9c198",
                "sha256":
                    "fbb37b276b0900fcfdcfc47f0584f9859726c3791b9b0e453dbac8178be26412"
              },
              "dob": "1977–05–01 13:29:43",
              "registered": "2009–05–12 00:46:03",
              "phone": "08–4889–2804",
              "cell": "0479–076–830",
              "id": {"name": "TFN", "value": "212902602"},
              "picture": {
                "large": "https://randomuser.me/api/portraits/women/90.jpg",
                "medium":
                    "https://randomuser.me/api/portraits/med/women/90.jpg",
                "thumbnail":
                    "https://randomuser.me/api/portraits/thumb/women/90.jpg"
              },
              "nat": "AU"
            }
          ],
          "info": {
            "seed": "7d4db9727474515a",
            "results": 1,
            "page": 1,
            "version": "1.1"
          }
        };
        var generateFakeData = fakeData['results'][0];
        generateFakeData['name']['first'] =
            "${generateFakeData['name']['first']} $index";
        return TinderUser.fromJson(generateFakeData);
      });
      yield TinderListShowCardListState(listFakeData);
    }
    if (event is TinderListSwipeNewCardEvent) {
      if (event.orientation.index == 0) {
        //SWIPE LEFT

      } else if (event.orientation.index == 1) {
        //SWIPE RIGHT
        await addToFavoriteList(event);
      }

      if (event.index == listFakeData.length - 1) {
        yield TinderListShowEmptyListState();
      }
    }
  }

  Future addToFavoriteList(TinderListSwipeNewCardEvent event) async {
    List<TinderUser> containList = [];
    containList = await TinderUser().getModel() as List<TinderUser>;
    containList = containList
        .where((tinderUser) =>
            tinderUser.name.first == event.currentUser.name.first)
        .toList();
    if (containList.isEmpty) {
      await TinderUser().insertModel(event.currentUser.toJson());
    }
  }
}
