import 'package:event_app/core/widgets/text_field_component.dart';
import 'package:event_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is! Authenticated) {
        context.go('/login');
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutEvent());
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Main page')],
          ),
        ),
      );
    });
  }
}
