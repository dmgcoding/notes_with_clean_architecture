part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.errorText,
    required this.formStatus,
  });
  final String email;
  final String password;
  final String? errorText;
  final FormStatus formStatus;

  const LoginState.initial()
      : email = '',
        password = '',
        errorText = null,
        formStatus = FormStatus.initial;

  LoginState copyWith({
    String? email,
    String? password,
    String? errorText,
    FormStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      errorText: errorText ?? this.errorText,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object> get props => [email, password, errorText ?? '', formStatus];
}
