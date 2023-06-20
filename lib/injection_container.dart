
import 'package:get_it/get_it.dart';
import 'package:izam_login/data/common/database/database_helper.dart';
import 'package:izam_login/domain/login/usecase/add_user_usecase.dart';
import 'package:izam_login/presentation/bloc/login_bloc.dart';

import 'data/login/repository/login_repository_impl.dart';
import 'domain/login/repository/LoginRepository.dart';
import 'domain/login/usecase/query_all_user_usecase.dart';
import 'domain/login/usecase/update_user_times-usecase.dart';



final injector = GetIt.instance;

Future<void> initDependencies() async {

  /// Data Source ///
// injector.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());


  /// Repository ///
  injector.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(helper: injector()));

  /// UseCase ///
  injector.registerLazySingleton(() => AddUserUseCase( loginRepository: injector()));
  injector.registerLazySingleton(() => UpdateUserUseCase(loginRepository: injector()));
 injector.registerLazySingleton(() => QueryAllUsersUseCase(loginRepository: injector()));

  /// BloC ///
  injector.registerFactory(() => LoginBloc(addUseCase: injector()));


  await injector<DatabaseHelper>().init();

}