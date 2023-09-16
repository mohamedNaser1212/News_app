import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/dio_helper.dart';

import '../cubits/app_cubit.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NewsCubit()..getBuisness()..getSports()..getScience(),
  child: BlocConsumer<NewsCubit, NewsStates>(
  listener: (context, state) {

  },
  builder: (context, state) {
    var cubit = NewsCubit.get(context);
    return Scaffold(
       appBar: AppBar(
          title: const Text('News App'),
         actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
               NewsCubit.get(context).changeAppMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),

           IconButton(
             onPressed: () {},
             icon: const Icon(Icons.settings),
           ),
         ],
        ),



      body: cubit.screens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        onTap: (index) {
          cubit.changeBottomNavBar(index);
        },
        items: cubit.bottomItems,
      ),
    );
  },
),
);
  }
}
