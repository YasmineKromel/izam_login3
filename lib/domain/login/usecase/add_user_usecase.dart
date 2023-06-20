

import 'package:dartz/dartz.dart';
import 'package:izam_login/core/error/failures.dart';
import 'package:izam_login/core/usecase/base_usecase.dart';
import 'package:izam_login/domain/login/entity/login-entity.dart';

import '../repository/LoginRepository.dart';

class AddUserUseCase extends BaseUseCase<int , LoginEntity>
{
   final LoginRepository loginRepository;
   AddUserUseCase({ required this.loginRepository});

  @override
  Future<Either<Failure, int>> call(LoginEntity params) async {
    return await loginRepository.addUser(params);
  }

}