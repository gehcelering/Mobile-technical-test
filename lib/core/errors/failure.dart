import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersFailure extends Failure {
  final String message;

  UsersFailure({required this.message});
}
