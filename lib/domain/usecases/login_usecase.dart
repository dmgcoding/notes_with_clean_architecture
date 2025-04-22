import 'package:clean_arch_test1/core/usecase/usecase.dart';
import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:clean_arch_test1/domain/usecases/models/requests/login_request.dart';

class LoginUsecase extends Usecase<bool, LoginRequest> {
  final AuthRepository authRepository;
  LoginUsecase({required this.authRepository});
  @override
  Future<bool> call(LoginRequest request) async {
    return authRepository.signIn(request.email, request.password);
  }
}
