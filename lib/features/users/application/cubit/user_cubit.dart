import 'package:customer/features/users/domain/models/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_users_use_case.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUseCase getUsers;
  UserCubit({required this.getUsers}) : super(UserInitial());

  loadUsers() async {
    final result = await getUsers("");
    result.fold(
      (failure) {
        emit(UserError(message: "Something failed: ${failure.toString()}"));
      },
      (users) {
        emit(UserLoaded(users: users));
      },
    );
  }

  getUsersList() async {
    List<UserEntity> data = [];
    if (state is UserLoaded) {
      return (state as UserLoaded).users;
    }

    return data;
  }
}
