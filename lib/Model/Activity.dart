import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final int? id;
  final String title;
  final String category;
  final String sticker;
  final DateTime dateTime;
  final String isDone;
  final String isFavorite;



  Activity(
      {this.id,
      required this.dateTime,
      required this.title,
      required this.category,
      required this.sticker,
      this.isDone = "No",
      this.isFavorite = "No"});



  factory Activity.fromMap(Map<String, dynamic> json) => Activity(
    id:json['id'],
      dateTime: DateTime.parse(json["dateTime"]),
      title: json["title"],
      category: json["category"],
      sticker: json["sticker"],
  isDone: json["isDone"],isFavorite: json["isFavorite"]);

  Map<String, dynamic> toMap() {
    return {
      "id":id,
      "title": title,
      "category": category,
      "sticker": sticker,
      "dateTime": dateTime.toIso8601String(),
      "isDone": isDone,
      "isFavorite": isFavorite
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,category,sticker,dateTime,isDone,isFavorite];
}
