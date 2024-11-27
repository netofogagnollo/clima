import 'package:internet_connection_checker/internet_connection_checker.dart';

class Config {
  Future<bool> isInternet() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
