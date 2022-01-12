import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/bloc/internet_cubit.dart';
import 'package:flutter_bloc_tutorial/presentation/routes/app_router.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/homescreenpage.dart';
import 'package:bloc/bloc.dart';

import 'logic/bloc/counter_cubit.dart';


void main() {
  runApp(   MyApp(
    connectivity: Connectivity(),
    appRouter: AppRouter(),));
}


class MyApp extends StatelessWidget{
  final AppRouter appRouter;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
  required this.connectivity,
  required this.appRouter}) :
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>
              InternetCubit(connectivity: connectivity)),

          BlocProvider(
              create: (context)=> CounterCubit()),

        ], child:MaterialApp(
      onGenerateRoute:appRouter.onGenerate ,
      home: HomeScreenPage(),),

    );

  }

}

