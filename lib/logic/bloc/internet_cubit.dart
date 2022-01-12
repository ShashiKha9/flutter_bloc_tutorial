import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tutorial/constants/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()){
    monitorInternet();
  }


  StreamSubscription<ConnectivityResult> monitorInternet() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emit(InternetConnected(connectionType: ConnectionType.Wifi));
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emit(InternetConnected(connectionType: ConnectionType.Mobile));
          }
          else if (connectivityResult == ConnectivityResult.none) {
            emit(InternetDisconnected());
          }
        });

  }
  @override
  close(){
    connectivityStreamSubscription.cancel();
   return  super.close();

  }
}