part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> users;
  const UserLoaded({required this.users});

  UserLoaded copyWith({
    List<UserEntity>? users,
  }) {
    return UserLoaded(
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [users];
}

class UserError extends UserState {
  final String message;
  const UserError({required this.message});
}
