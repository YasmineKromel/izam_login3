import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:izam_login/domain/login/entity/login-entity.dart';
import 'package:meta/meta.dart';

import '../../domain/login/usecase/add_user_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AddUserUseCase addUseCase;
  LoginBloc({required this.addUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginUserEvent)
        {
          emit(LoginLoading());
          final  result = await addUseCase.loginRepository.queryAllUsers();
          result.fold(
                  (l) => emit( QueryUserFail(l.toString())),
                  (r) async {
                    for (final row in r) {
                      if (row['mail'] == event.model.email) {
                        final updateResult = await addUseCase.loginRepository.updateUser(event.model);
                        updateResult.fold((l) =>  emit( UpdateUserFail(l.toString())), (r) => emit(UpdateUserSuccess(r)));

                      }
                    }
                  }
          );
        }
    });
  }
}
