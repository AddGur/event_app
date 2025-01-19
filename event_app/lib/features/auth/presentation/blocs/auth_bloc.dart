import 'package:equatable/equatable.dart';
import 'package:event_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppStartedEvent>(_onAppStarted);
    on<LoginEvent>(_onLoginRequested);
    on<SignUpEvent>(_onSignUpRequested);
    on<LogoutEvent>(_onLogoutRequested);
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
  }

  Future<void> _onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      emit(Authenticated(userId: user.uid));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginRequested(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final result = await authRepository.login(event.email, event.password);
      result.match(
        (l) => emit(AuthError(message: l.message)),
        (r) => emit(Authenticated(userId: r.uid)),
      );
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential =
          await authRepository.signUp(event.email, event.password);
      userCredential.fold((l) => emit(AuthError(message: l.toString())),
          (r) => emit(Authenticated(userId: r.uid)));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    authRepository.logout();
    emit(Unauthenticated());
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    // final user = _firebaseAuth.currentUser;
    // if (user != null) {
    //   emit(Authenticated(userId: user.uid));
    // } else {
    //   emit(Unauthenticated());
    // }
  }
}
