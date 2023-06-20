
import 'package:dartz/dartz.dart';
import 'package:izam_login/domain/login/entity/login-entity.dart';

import '../../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure,bool>> login(LoginEntity login);
  Future<Either<Failure,int>> addUser(LoginEntity login);
  Future<Either<Failure,List<Map<String, dynamic>>>> queryAllUsers();
  Future<Either<Failure,int>> updateUser(LoginEntity login);
}