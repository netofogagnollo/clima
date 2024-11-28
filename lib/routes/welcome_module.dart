import 'package:clima/features/inicial/welcome.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends Module {
  static const ROUTE = '/';

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (_) => WelcomePage());
  }
}
