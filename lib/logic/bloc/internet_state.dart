part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();
}

class InternetLoading extends InternetState {
  @override
  List<Object> get props => [];
}
class InternetConnected extends  InternetLoading{
  final ConnectionType connectionType;
  InternetConnected({ required this.connectionType});


}
class InternetDisconnected extends InternetLoading{

}
