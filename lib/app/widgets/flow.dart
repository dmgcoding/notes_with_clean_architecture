import 'package:clean_arch_test1/app/bloc/auth_status/auth_status_cubit.dart';
import 'package:clean_arch_test1/app/routes/routes.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowWidget extends StatelessWidget {
  const FlowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStatusCubit, AuthStatusState>(
      builder: (context, state) {
        return FlowBuilder<AuthStatusState>(
          state: context.read<AuthStatusCubit>().state,
          onGeneratePages: onGeneratePages,
        );
      },
    );
  }
}
