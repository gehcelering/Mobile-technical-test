import 'package:customer/domain/entities/usuarios_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_all_users_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUsersUseCase getUsers;
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

  getUserList() async {
    List<UserEntity> data = [];
    if (state is HomeLoaded) {
      return (state as HomeLoaded).users;
    }

    return data;
  }
}
