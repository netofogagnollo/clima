import 'package:clima/routes/clima_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _color1 = ColorTween(
      begin: Colors.blue,
      end: Colors.grey,
    ).animate(_controller);

    _color2 = ColorTween(
      begin: Colors.grey,
      end: Colors.blue,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_color1.value!, _color2.value!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Bem Vindo',
                style: TextStyle(
                  fontSize: 36, // Tamanho da fonte
                  fontWeight: FontWeight.bold, // Peso da fonte
                  letterSpacing: 2.0, // Espaçamento entre letras
                  color: Colors.white, // Cor do texto
                  shadows: [
                    Shadow(
                      blurRadius: 5.0, // Suavidade da sombra
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(2, 2), // Deslocamento da sombra
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed(ClimaModule.ROUTE);
                  },
                  child: Text(
                    'Buscar clima',
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
