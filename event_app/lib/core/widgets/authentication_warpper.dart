import 'package:event_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthenticationWarpper extends StatefulWidget {
  const AuthenticationWarpper({super.key});

  @override
  State<AuthenticationWarpper> createState() => _AuthenticationWarpperState();
}

class _AuthenticationWarpperState extends State<AuthenticationWarpper> {
  @override
  void initState() {
    context.read<AuthBloc>().add(AppStartedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go('/home');
        } else {
          context.go('/login');
        }
      },
      child: const CircularProgressIndicator(),
    );
  }
}
