import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kirabot/Cubit/app_cubit.dart';
import 'package:kirabot/Cubit/app_state.dart';
import 'package:kirabot/Screen/mainScreen.dart';

import 'Cubit/bloc_observer.dart';
import 'Screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context)=>AppCubit(),
     child: BlocConsumer<AppCubit,AppState>(
       listener: (context,state){},
       builder: (context,state){
         return MaterialApp(
           title: 'Flutter Demo',
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             appBarTheme: const AppBarTheme(
                 color: Color.fromRGBO(230, 230, 230, 1)
             ),
             scaffoldBackgroundColor: const Color.fromRGBO(238, 238, 238, 1),
           ),
           home:   SplashScreen(),
         );
       },
     )
     ,
   );
  }
}

