import 'dart:async';

import 'package:clima/features/clima/presentation/bloc/clima_cubit.dart';
import 'package:clima/features/clima/presentation/bloc/clima_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClimaPage extends StatefulWidget {
  const ClimaPage({super.key});

  @override
  State<ClimaPage> createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    super.initState();
    var cubit = Modular.get<ClimaCubit>();
    streamSubscription = cubit.stream.listen((state) {
      if (state is ClimaFailureState) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Erro'),
                  content: Text(state.message),
                ));
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cubit.init();
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  Widget body = Container();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ClimaCubit>();
    final state = cubit.state;

    if (state is ClimaInitState) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
    }
    if (state is ClimaLoadingState) {
      body = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
    }
    if (state is ClimaLoadedState) {
      body = Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: state.clima.length,
              itemBuilder: (context, index) {
                var clima = state.clima[index];
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Latitude: ${clima.latitude}'),
                        Text('Longitude: ${clima.longitude}'),
                        Text('Elevação: ${clima.elevation}'),
                        Text('Timezone: ${clima.timeZone}'),
                        Text('timeZoneAbv: ${clima.timeZoneAbv}'),
                        Text('utc: ${clima.utcOffset}'),
                        Text('Intervalo: ${clima.weather?.interval} ${clima.weatherUnits?.interval}'),
                        Text('Dia: ${clima.weather?.isDay} ${clima.weatherUnits?.isDay}'),
                        Text('temperature: ${clima.weather?.temperature} ${clima.weatherUnits?.temperature}'),
                        Text('Hora: ${clima.weather?.time} ${clima.weatherUnits?.time}'),
                        Text('ClimaCode: ${clima.weather?.weatherCode} ${clima.weatherUnits?.weatherCode ?? ''}'),
                        Text(
                            'Direção do Vento: ${clima.weather?.windDirection} ${clima.weatherUnits?.windDirection ?? ''}'),
                        Text('Velocidade do Vento: ${clima.weather?.windSpeed} ${clima.weatherUnits?.windSpeed ?? ''}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Clima'),
        ),
        body: body);
  }
}
