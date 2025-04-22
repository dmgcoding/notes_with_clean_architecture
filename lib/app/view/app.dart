import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/app/widgets/flow.dart';
import 'package:clean_arch_test1/domain/repositories/auth_repository.dart';
import 'package:clean_arch_test1/domain/repositories/fsecure_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/hive_storage_repository.dart';
import 'package:clean_arch_test1/domain/repositories/notes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.authRepository,
    required this.hiveStorageRepository,
    required this.fSecureStorageRepository,
    required this.notesRepository,
    super.key,
  });
  final AuthRepository authRepository;
  final HiveStorageRepository hiveStorageRepository;
  final FSecureStorageRepository fSecureStorageRepository;
  final NotesRepository notesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: hiveStorageRepository),
        RepositoryProvider.value(value: fSecureStorageRepository),
        RepositoryProvider.value(value: notesRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthStatusCubit(context.read<AuthRepository>()),
        ),
      ],
      child: MaterialApp(
        home: FlowWidget(),
      ),
    );
  }
}
