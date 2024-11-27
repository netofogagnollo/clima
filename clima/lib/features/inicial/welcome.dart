import 'package:clima/routes/clima_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text('Bem Vindo'),
          ),
          ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed(ClimaModule.ROUTE);
              },
              child: Text('Buscar clima'))
        ],
      ),
    );
  }
}
