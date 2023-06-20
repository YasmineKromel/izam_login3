import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}


class NoDataFailure extends Failure {
  @override
  List<Object> get props => [];
}
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class DatabaseFailure extends Failure {
  @override
  List<Object> get props => [];
}

class LoginFailure extends Failure {
  @override
  List<Object> get props => [];
}