part of 'events_bloc.dart';

sealed class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

final class EventsInitial extends EventsState {}

final class EventsLoading extends EventsState {}

final class EventsLoaded extends EventsState {
  final List<EventModel> events;

  const EventsLoaded({required this.events});

  @override
  List<Object> get props => [events];
}

final class EventsError extends EventsState {
  final Failure failure;

  const EventsError({required this.failure});

  @override
  List<Object> get props => [failure];
}
