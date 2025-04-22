import 'package:bloc/bloc.dart';
import 'package:clean_arch_test1/core/common/form_status.dart';
import 'package:clean_arch_test1/domain/usecases/login_usecase.dart';
import 'package:clean_arch_test1/domain/usecases/models/requests/login_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUsecase}) : super(LoginState.initial());
  final LoginUsecase loginUsecase;

  void changeEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void changePassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> submit() async {
    try {
      final request =
          LoginRequest(email: state.email, password: state.password);
      final response = await loginUsecase.call(request);
      if (response) {
        emit(state.copyWith(formStatus: FormStatus.success));
      } else {
        emit(state.copyWith(
            formStatus: FormStatus.error,
            errorText: 'Invalid email or password'));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(
          formStatus: FormStatus.error, errorText: e.toString()));
    }
  }
}
