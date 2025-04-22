import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/presentation/pages/auth/login.dart';
import 'package:clean_arch_test1/presentation/pages/notes/notes_list.dart';
import 'package:clean_arch_test1/presentation/pages/splash/splash.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGeneratePages(
  AuthStatusState state,
  List<Page<dynamic>> pages,
) {
  if (state == AuthStatusState.authenticated) {
    return [NotesListPage.page()];
  } else if (state == AuthStatusState.unauthenticated) {
    return [LoginPage.page()];
  }
  return [SplashPage.page()];
}
