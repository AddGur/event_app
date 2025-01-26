import 'package:event_app/core/theme/app_theme.dart';
import 'package:event_app/core/widgets/text_field_component.dart';
import 'package:event_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppTheme.loginGradient,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      child: BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is Authenticated) {
                              context.go('/home');
                            } else if (state is AuthError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)));
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFieldComponent(
                                label: 'login',
                                controller: emailController,
                              ),
                              TextFieldComponent(
                                label: 'password',
                                controller: passwordController,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go('/login');
                                },
                                child: Text(
                                  'Already have an acconunt? Log in',
                                  style: AppTheme.displaySmall
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    context.read<AuthBloc>().add(
                                        RegisgtrationEvent(
                                            email: emailController.text,
                                            password: passwordController.text));
                                  },
                                  child: const Text('Sign up'))
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
