part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFail extends LoginState {
  final String message ;
  LoginFail(this.message);
}

class AddUserSuccess extends LoginState {
  final int model;
  AddUserSuccess(this.model);
}

class UpdateUserSuccess extends LoginState {
  final int model;
  UpdateUserSuccess(this.model);
}

class QueryUserSuccess extends LoginState {
  final bool model;
  QueryUserSuccess(this.model);
}

class AddUserFail extends LoginState {
  final String message ;
  AddUserFail(this.message);
}

class QueryUserFail extends LoginState {
  final String message ;
  QueryUserFail(this.message);
}

class UpdateUserFail extends LoginState {
  final String message ;
  UpdateUserFail(this.message);
}