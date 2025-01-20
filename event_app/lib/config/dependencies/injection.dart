import 'package:event_app/features/auth/data/repositories/auth_repository.dart';
import 'package:event_app/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:event_app/features/home/data/services/event_service.dart';
import 'package:event_app/features/home/presentation/bloc/events_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepository(getIt<FirebaseAuth>()));

  getIt.registerFactory(
    () => AuthBloc(getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<EventService>(
    () => EventService(),
  );
  getIt.registerFactory(
    () => EventsBloc(getIt<EventService>()),
  );
}
