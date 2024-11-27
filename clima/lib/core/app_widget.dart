import 'package:clima/routes/welcome_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(WelcomeModule.ROUTE);
    Modular.setNavigatorKey;

    return ScreenUtilInit(
        designSize: Size(428, 926),
        builder: (context, child) => MaterialApp.router(
              localizationsDelegates: [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [Locale('pt', 'BR')],
              debugShowCheckedModeBanner: false,
              routerConfig: Modular.routerConfig,
            ));
  }
}
