import 'package:bloc/bloc.dart';
import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

part 'auth_status_state.dart';

class AuthStatusCubit extends Cubit<AuthStatusState> {
  AuthStatusCubit(this.authRepository) : super(AuthStatusState.initial) {
    initialize();
  }
  final AuthRepository authRepository;

  void initialize() async {
    try {
      final isAuthenticated = await authRepository.checkForAuth();
      emit(isAuthenticated
          ? AuthStatusState.authenticated
          : AuthStatusState.unauthenticated);
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthStatusState.unknown);
    }
  }

  void updateStatus(AuthStatusState status) {
    emit(status);
  }
}
