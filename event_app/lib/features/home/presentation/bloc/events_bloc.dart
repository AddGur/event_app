import 'package:equatable/equatable.dart';
import 'package:event_app/core/error/failure.dart';
import 'package:event_app/features/home/data/models/event_model.dart';
import 'package:event_app/features/home/data/services/event_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventService eventService;

  EventsBloc(this.eventService) : super(EventsInitial()) {
    on<EventsLoadEvent>(_fetchEvents);
  }

  Future<void> _fetchEvents(event, emit) async {
    emit(EventsLoading());

    final fetch = await eventService.fetchEvents();
    fetch.fold((l) => emit(EventsError(failure: l)),
        (r) => emit(EventsLoaded(events: r)));
  }
}
