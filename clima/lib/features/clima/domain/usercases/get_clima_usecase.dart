import 'package:clima/features/clima/data/repositories/clima_repository.dart';

class GetClimaUsecase {
  Future<Map<String, dynamic>> call() async {
    return await ClimaRepository().getClima();
  }
}
