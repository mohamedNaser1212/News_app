import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/app_cubit.dart';

//baseurl: https://newsapi.org/
//method: v2/top-headlines?

//query: country=us&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

 //https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca





 Widget buildNewsItem(dynamic article,context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  '${article['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']} ',
                      style:Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style:const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  Widget articleBuilder(list,context)=>ConditionalBuilder(
                                         condition: list.length > 0,
                                         builder: (context) => ListView.separated(
                                           physics: const BouncingScrollPhysics(),
                                           itemBuilder: (context, index) => buildNewsItem(list[index],context),
                                           separatorBuilder: (context, index) => const Divider(
                                             height: 1,
                                             color: Colors.grey,
                                           ),
                                           itemCount: list.length,
                                         ),
                                         fallback: (context) =>
                                         const Center(child: CircularProgressIndicator(),
                                         ),
                                       );