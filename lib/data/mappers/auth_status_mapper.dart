import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/core/common/form_status.dart';

AuthStatusState fromLoginFormStatus(FormStatus formStatus) {
  switch (formStatus) {
    case FormStatus.success:
      return AuthStatusState.authenticated;
    case FormStatus.error:
      return AuthStatusState.unauthenticated;
    default:
      return AuthStatusState.unauthenticated;
  }
}
