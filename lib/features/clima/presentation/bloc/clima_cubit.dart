import 'package:clima/features/clima/domain/entites/clima_entity.dart';
import 'package:clima/features/clima/domain/entites/weather.dart';
import 'package:clima/features/clima/domain/entites/weather_units.dart';
import 'package:clima/features/clima/domain/usercases/get_clima_usecase.dart';
import 'package:clima/features/clima/presentation/bloc/clima_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimaCubit extends Cubit<ClimaState> {
  final GetClimaUsecase getClimaUsecase;
  ClimaCubit(this.getClimaUsecase) : super(const ClimaInitState());

  init() async {
    if (state is ClimaInitState) {
      try {
        var climas = await getClima();
        emit(ClimaLoadedState(climas));
      } catch (e) {
        emit(ClimaFailureState(e.toString()));
      }
    }
  }

  Future<List<ClimaEntity>> getClima() async {
    var response = await getClimaUsecase();
    ClimaEntity clima = ClimaEntity.fromJson(response);
    clima.weather = Weather.fromJson(response['current_weather']);
    clima.weatherUnits = WeatherUnits.fromJson(response['current_weather_units']);

    List<ClimaEntity> climas = [clima];
    return climas;
  }
}
