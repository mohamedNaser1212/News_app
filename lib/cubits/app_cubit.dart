import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Screens/business_layout.dart';
import 'package:news_app/Screens/science_screen.dart';
import 'package:news_app/Screens/settings_screen.dart';
import 'package:news_app/Screens/sports_screen.dart';
import 'package:news_app/cache_helper.dart';

import '../dio_helper.dart';

part 'app_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),


  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  List<dynamic> business = [];
void getBuisness(){
  if(business.isEmpty) {
    emit(NewsGetBuisnessLoadinState());
    DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBuisnessSucessState());
    }
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetBuisnessErrorState(error.toString()));
    });
  }else {
    emit(NewsGetBuisnessSucessState());
  }


}
List<dynamic> sports = [];
void getSports() {
  if (sports.isEmpty) {
    emit(NewsGetSportsLoadinState());

    DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSucessState());
    }
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  else {
    emit(NewsGetSportsSucessState());
  }
}


  List<dynamic> science = [];
  void getScience() {
    if (science.isEmpty) {
      emit(NewsGetSportsLoadinState());
      DioHelper.getData(url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSucessState());
      }
      ).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }else {
      emit(NewsGetScienceSucessState());
    }
  }



  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsAppchangeModeState());

    } else {
      isDark = !isDark;
      CacheHelper.saveBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppchangeModeState());
      });
    }

    print(isDark);

  }
}
