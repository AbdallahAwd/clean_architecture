import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Network {
  Future<bool> get isConnected;
}

class NetworkImp implements Network {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkImp({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
