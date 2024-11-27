import 'package:clima/config/bloc_config.dart';
import 'package:clima/features/clima/data/datasources/clima_remote_datasource.dart';
import 'package:clima/features/clima/data/repositories/clima_repository.dart';
import 'package:clima/features/clima/domain/usercases/get_clima_usecase.dart';
import 'package:clima/features/clima/presentation/bloc/clima_cubit.dart';
import 'package:clima/features/clima/presentation/clima_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClimaModule extends Module {
  static const ROUTE = '/clima/';

  @override
  void binds(i) {
    i.addSingleton<ClimaCubit>(ClimaCubit.new, config: blocConfig());
    i.addInstance<GetClimaUsecase>(GetClimaUsecase());
    i.addInstance<ClimaRepository>(ClimaRepository());
    i.addInstance<ClimaRemoteDatasource>(ClimaRemoteDatasource());
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => ClimaPage());
  }
}
