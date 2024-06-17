part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<UsuariosEntity> users;
  const HomeLoaded({required this.users});

  HomeLoaded copyWith({
    List<UsuariosEntity>? user,
  }) {
    return HomeLoaded(
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [users];
}
