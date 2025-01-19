import 'package:event_app/features/auth/presentation/pages/authentication_screen.dart';
import 'package:event_app/core/widgets/authentication_warpper.dart';
import 'package:event_app/features/home/presentation/pages/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthenticationWarpper(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const AuthenticationScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePageScreen(),
      ),
    ],
    // redirect: (context, state) {
    //   final isAuthenticated = false; // Replace with actual auth logic
    //   final isLoggingIn = state.uri.path == '/login';

    //   if (!isAuthenticated && !isLoggingIn) {
    //     return '/login';
    //   } else if (isAuthenticated && isLoggingIn) {
    //     return '/home';
    //   }
    //   return null; // No redirect
    // },
  );
}
