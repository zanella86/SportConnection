class EventDTOModel {

  EventDTOModel({
    this.id = 0,
    required this.name,
    required this.description,
    required this.time,
    required this.frequency,
    required this.eventType,
    required this.paid,
    required this.address
  });

  final int id;
  final String name;
  final String description;
  final String time;
  final String frequency;
  final String eventType;
  final bool paid;
  final String address;


  factory EventDTOModel.fromJson(Map<String, dynamic> json) => EventDTOModel(
      id: json['id'] ?? 0,
      name: json['name'],
      description: json['description'],
      frequency: json['frequency'],
      time: json['time'],
      address: json['address'],
      eventType: json['typeEvent'],
      paid: json['paid'],
  );

  static Map<String, dynamic> toJson(EventDTOModel eventDTOModel) => {
    'name' : eventDTOModel.name,
    'description' : eventDTOModel.description,
    'frequency' : eventDTOModel.frequency,
    'time' : eventDTOModel.time,
    'address' : eventDTOModel.address,
    'typeEvent' : eventDTOModel.eventType,
    'paid' : eventDTOModel.paid,
    'id' : eventDTOModel.id,
  };
}