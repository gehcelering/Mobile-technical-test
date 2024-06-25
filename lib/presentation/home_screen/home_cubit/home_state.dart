part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<UserEntity> users;
  const HomeLoaded({required this.users});

  HomeLoaded copyWith({
    List<UserEntity>? user,
  }) {
    return HomeLoaded(
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [users];
}
