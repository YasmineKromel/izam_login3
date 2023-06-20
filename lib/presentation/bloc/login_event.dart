part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginUserEvent implements LoginEvent{
  final LoginEntity model;
  LoginUserEvent({required this.model});
}

class AddUserEvent implements LoginEvent{
  final LoginEntity model;
  AddUserEvent({required this.model});
}

class UpdateUserEvent implements LoginEvent{
  final LoginEntity model;
  UpdateUserEvent({required this.model});
}

class QueryAllUsersEvent implements LoginEvent{

}
