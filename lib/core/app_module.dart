import 'package:clima/routes/clima_module.dart';
import 'package:clima/routes/welcome_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(WelcomeModule.ROUTE, module: WelcomeModule());
    r.module(ClimaModule.ROUTE, module: ClimaModule());
  }
}
