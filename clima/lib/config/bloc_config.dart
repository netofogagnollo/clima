import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

BindConfig<T> blocConfig<T extends Cubit>() {
  return BindConfig(notifier: (bloc) => bloc.stream, onDispose: (bloc) => bloc.close());
}
