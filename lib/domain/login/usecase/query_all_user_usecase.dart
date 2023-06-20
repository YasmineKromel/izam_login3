




import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entity/login-entity.dart';
import '../repository/LoginRepository.dart';

class QueryAllUsersUseCase extends BaseUseCase<List<Map<String, dynamic>> , DefaultParams>
{
  final LoginRepository loginRepository;
  QueryAllUsersUseCase({ required this.loginRepository});

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> call(params) async {
    return await loginRepository.queryAllUsers();
  }

}