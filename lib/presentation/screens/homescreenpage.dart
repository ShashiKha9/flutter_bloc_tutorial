import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/constants/enum.dart';
import 'package:flutter_bloc_tutorial/logic/bloc/counter_cubit.dart';
import 'package:flutter_bloc_tutorial/logic/bloc/internet_cubit.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/secondscreen.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/thirdscreen.dart';

class HomeScreenPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocConsumer<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wi-Fi',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.green,
                    ),
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.red,
                    ),
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.grey,
                    ),
                  );
                };
                 return CircularProgressIndicator();
              },
              listener: (context,state){
                if(state is InternetConnected &&
                state.connectionType == ConnectionType.Wifi){
                  return BlocProvider.of<CounterCubit>(context).increment();
                }
                else if(state is InternetConnected &&
                state.connectionType ==ConnectionType.Mobile){
                return  BlocProvider.of<CounterCubit>(context).decrement();

                }
                else{
                  return BlocProvider.of<CounterCubit>(context).decrement();
                }
              },
            ),
            Divider(
              height: 5,
            ),

            BlocConsumer<CounterCubit,CounterState>(
              builder: (context,state){
                if(state.countervalue >0){
                 return  Text( "Max "+state.countervalue.toString(),style: TextStyle(fontSize: 25),);

                } else if(state.countervalue ==0){
                  return Text("Zero "+state.countervalue.toString());
                } else if(state.countervalue == 5){
                  return Text("Max++ "+state.countervalue.toString());
                }
                else{
                 return   Text("Min "+state.countervalue.toString());
                }

        },

              listener: (context,state){
              if(state.wasincremented==true){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Incremented by 1"),
                  duration: Duration(milliseconds: 300),),

                );
              } else if(state.wasincremented==false){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Decremented by 1"),
                  duration: Duration(milliseconds: 300),)
                );
              }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  BlocProvider.of<CounterCubit>(context).increment();

                },
                    icon: const Icon(Icons.add),iconSize: 25,color: Colors.green,),


                IconButton(onPressed: (){
                  // BlocProvider.of<CounterCubit>(context).decrement();
                  context.read<CounterCubit>().decrement();


                }, icon: const Icon(Icons.remove),iconSize: 25,color: Colors.red,)
              ],            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){

              Navigator.pushNamed(context, "/third");

            },
            child: Text("SecondScreen"),),

            ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/third");

            },
              child: Text("Third Screen"),)

          ],
        ),
      ),

    );

  }

}