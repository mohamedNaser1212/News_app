import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Screens/news_layout.dart';
import 'package:news_app/cache_helper.dart';
import 'package:news_app/cubits/app_cubit.dart';
import 'package:news_app/dio_helper.dart';

import 'cubits/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();
 bool? isDark = CacheHelper.getBoolean(key: 'isDark');


  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark);

  final bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

          BlocProvider(
            create: (BuildContext context) => NewsCubit()..getBuisness()..getSports()..getScience(),
          ),
         BlocProvider(
          create: (BuildContext context) => NewsCubit()..changeAppMode(
    fromShared: isDark,
    ),
         ),
      ],

        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                textTheme: const TextTheme(
                  bodyText2: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                  backgroundColor: Colors.white,
                ),
              ),

              darkTheme: ThemeData(

                textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                  backgroundColor: HexColor('333739'),
                ),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,

                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),

                  backgroundColor: HexColor('333739'),
                  elevation: 0,
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                ),
                scaffoldBackgroundColor: HexColor('333739'),
              ),
              themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

              home:  NewsLayout(),

            );
          },
        ),


    );
  }
}
