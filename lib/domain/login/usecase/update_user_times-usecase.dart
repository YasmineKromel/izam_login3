



import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entity/login-entity.dart';
import '../repository/LoginRepository.dart';

class UpdateUserUseCase extends BaseUseCase<int , LoginEntity>
{
  final LoginRepository loginRepository;
  UpdateUserUseCase({ required this.loginRepository});

  @override
  Future<Either<Failure, int>> call(LoginEntity params) async {
    return await loginRepository.addUser(params);
  }

}