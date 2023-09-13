import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/Screens/business_layout.dart';
import 'package:news_app/Screens/science_screen.dart';
import 'package:news_app/Screens/settings_screen.dart';
import 'package:news_app/Screens/sports_screen.dart';

part 'app_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(AppInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }
}
