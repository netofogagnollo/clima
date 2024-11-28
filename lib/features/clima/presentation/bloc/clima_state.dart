import 'package:clima/features/clima/domain/entites/clima_entity.dart';

sealed class ClimaState {}

class ClimaInitState implements ClimaState {
  const ClimaInitState();
}

class ClimaLoadingState implements ClimaState {
  const ClimaLoadingState();
}

class ClimaLoadedState implements ClimaState {
  final List<ClimaEntity> clima;
  const ClimaLoadedState(this.clima);
}

class ClimaFailureState implements ClimaState {
  final String message;
  ClimaFailureState(this.message);
}
