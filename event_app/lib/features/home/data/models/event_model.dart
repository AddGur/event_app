import 'dart:convert';

class EventModel {
  final String title;
  final String description;
  final String image;
  final String date;
  final Location location;

  EventModel({
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.location,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      date: json['date'],
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final String venue;
  final String address;

  Location({
    required this.venue,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      venue: json['venue'],
      address: json['address'],
    );
  }
}

List<EventModel> parseEvents(String responseBody) {
  final parsed = json.decode(responseBody);
  return (parsed['events'] as List)
      .map((json) => EventModel.fromJson(json))
      .toList();
}
