import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/core/common/form_status.dart';
import 'package:clean_arch_test1/data/mappers/auth_status_mapper.dart';
import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:clean_arch_test1/domain/usecases/login_usecase.dart';
import 'package:clean_arch_test1/presentation/bloc/login/login_cubit.dart';
import 'package:clean_arch_test1/presentation/widgets/form_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<dynamic> page() => MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginUsecase:
            LoginUsecase(authRepository: context.read<AuthRepository>()),
      ),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.formStatus == FormStatus.success) {
          final status = fromLoginFormStatus(state.formStatus);
          context.read<AuthStatusCubit>().updateStatus(status);
        } else if (state.formStatus == FormStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorText ?? 'Error logging in')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormInputField(
                onChanged: (val) => context.read<LoginCubit>().changeEmail(val),
                labelText: 'Email',
                errorText: context.watch<LoginCubit>().state.errorText,
              ),
              FormInputField(
                onChanged: (val) => context.read<LoginCubit>().changeEmail(val),
                labelText: 'Password',
                errorText: context.watch<LoginCubit>().state.errorText,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.read<LoginCubit>().submit(),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
