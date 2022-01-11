
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/bloc/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/homescreenpage.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/secondscreen.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/thirdscreen.dart';

class AppRouter{
  Route? onGenerate(RouteSettings settings){
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_)=>BlocProvider.value(
                value:BlocProvider.of<CounterCubit>(_),
               child: HomeScreenPage())
        );

      case "/second":
        return MaterialPageRoute(
            builder: (_)=>BlocProvider.value(
                value:BlocProvider.of<CounterCubit>(_),
                child:SecondScreen())
        );

      case "/third":
        return MaterialPageRoute(
            builder: (_)=>ThirdScreen());
      default:
        return null;


    }

  }
}