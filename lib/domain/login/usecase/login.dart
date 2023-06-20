
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:izam_login/domain/login/entity/login-entity.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/base_usecase.dart';
import '../repository/LoginRepository.dart';

class Login implements BaseUseCase<bool, Params> {
final LoginRepository loginRepository;

Login(this.loginRepository);

@override
Future<Either<Failure, bool>> call(Params params) async {
return await loginRepository.login(params.login);
}
}

class Params extends Equatable {
  final LoginEntity login;

  Params({
    required this.login,
  });

  @override
  List<Object> get props => [login];
}