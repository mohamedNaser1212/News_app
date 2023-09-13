import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/app_cubit.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NewsCubit(),
  child: BlocConsumer<NewsCubit, NewsStates>(
  listener: (context, state) {
    // TODO: implement listener
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
              onPressed: () {},
              icon: const Icon(Icons.brightness_4_outlined),
            ),
         ],
        ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentIndex,
        onTap: (index) {
          cubit.changeBottomNavBar(index);
        },
        items: cubit.bottomItems,
      ),
      body: cubit.screens[cubit.currentIndex],
    );
  },
),
);
  }
}
