import 'package:event_app/config/dependencies/injection.dart';
import 'package:event_app/config/router/app_router.dart';
import 'package:event_app/core/theme/app_theme.dart';
import 'package:event_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:event_app/features/home/presentation/bloc/events_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:
          DefaultFirebaseOptions.currentPlatform); // Inicjalizacja Firebase
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>()..add(AppStartedEvent()),
        ),
        BlocProvider<EventsBloc>(create: (context) => getIt<EventsBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Event app',
        theme: AppTheme.lightTheme,
        routerDelegate: appRouter.router.routerDelegate,
        routeInformationParser: appRouter.router.routeInformationParser,
        routeInformationProvider: appRouter.router.routeInformationProvider,
      ),
    );
  }
}
