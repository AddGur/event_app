import 'package:dio/dio.dart';
import 'package:event_app/features/home/data/models/event_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';

class EventService {

  Future<Either<Failure, List<EventModel>>> fetchEvents() async {
    try {
      final response = await Dio().get(
          'https://raw.githubusercontent.com/AddGur/dummy_events/refs/heads/main/events.json');

      if (response.statusCode == 200) {
        return Right(parseEvents(response.data.toString()));
      } else {
        return Left(Failure(message: 'Failed to load events'));
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
