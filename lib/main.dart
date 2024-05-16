import 'package:all_weather_app/pages/homepage.dart';
import 'package:all_weather_app/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create:(ctx) => weatherProv(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
  final _router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      //name: 'Home',
      name: HomePageM.routeName,
      path: '/',
      builder: (context, state) =>  HomePageM(),
    )
  ]);
}

