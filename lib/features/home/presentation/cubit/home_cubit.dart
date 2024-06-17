import 'package:customer/core/models/usuarios_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/user.dart';
import '../../domain/usecases/getUsuariosuseCase.dart';
import '../../domain/usecases/obtener_usuarios.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ObtenerUsuariosUseCase getUsers;
  HomeCubit({required this.getUsers}) : super(HomeInitial());

  load() async {
    await getUsers("")
      ..fold(
        (l) {
          print("error");
        },
        (r) {
          var estado = HomeLoaded(users: r);
          emit(estado);
        },
      );
  }

  getListadoUsuarios() async {
    List<UsuariosEntity> data = [];
    if (state is HomeLoaded) {
      return (state as HomeLoaded).users;
    }

    return data;
  }
}
