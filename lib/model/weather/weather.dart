class Weather {
  // double? lat;
  // double? lon;
  // String? timezone;
  // int? timezoneOffset;
  // Current? current;
  // List<Minutely>? minutely;
  // List<Hourly>? hourly;
  // List<Daily>? daily;
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
