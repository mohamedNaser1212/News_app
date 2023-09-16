part of 'app_cubit.dart';

@immutable
abstract class NewsStates {}

class AppInitial extends NewsStates {}
class AppBottomNavState extends NewsStates {}

class NewsGetBuisnessSucessState extends NewsStates {}
class NewsGetBuisnessLoadinState extends NewsStates {}
class NewsGetBuisnessErrorState extends NewsStates {
  final String error;
  NewsGetBuisnessErrorState(this.error);
}

class NewsGetSportsSucessState extends NewsStates {}
class NewsGetSportsLoadinState extends NewsStates {}
class NewsGetSportsErrorState extends NewsStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSucessState extends NewsStates {}
class NewsGetScienceLoadinState extends NewsStates {}
class NewsGetScienceErrorState extends NewsStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsAppchangeModeState extends NewsStates {


}


class NewsGetSearchSucessState extends NewsStates {}
class NewsGetSearchLoadinState extends NewsStates {}
class NewsGetSearchErrorState extends NewsStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}



