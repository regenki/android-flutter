class Activity {
  final int id;
  final String title;
  final String category;
  final String sticker;
  final DateTime dateTime;
  final bool isDone;
  final bool isFavorite;

  Activity(
      {required this.id,
      required this.dateTime,
      required this.title,
      required this.category,
      required this.sticker,
      this.isDone = false,
      this.isFavorite = false});

  factory Activity.fromMap(Map<String, dynamic> json) => Activity(
      id: json["id"],
      dateTime: DateTime.parse(json["dateTime"]),
      title: json["title"],
      category: json["category"],
      sticker: json["sticker"],
  isDone: json["isDone"],isFavorite: json["isFavorite"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "sticker": sticker,
      "dateTime": dateTime.toIso8601String(),
      "isDone": isDone,
      "isFavorite": isFavorite
    };
  }
}
