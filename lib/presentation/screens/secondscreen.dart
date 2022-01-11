import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/logic/bloc/counter_cubit.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

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
                  BlocProvider.of<CounterCubit>(context).decrement();


                }, icon: const Icon(Icons.remove),iconSize: 25,color: Colors.red,)
              ],            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            },
              child: Text("Go Back"),),


          ],
        ),
      ),

    );

  }

}