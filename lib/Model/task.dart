import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  late final String tital;
  late final String description;
  late final String id;
  late final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavorite;

  Task({
    required this.tital,
    required this.description,
    required this.id,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isFavorite ?? false;
  }
  Task copyWith(
      {String? tital,
      String? description,
      String? id,
      String? date,
      bool? isDone,
      bool? isDeleted,
      bool? isFavorite}) {
    return Task(
      tital: tital ?? this.tital,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tital': tital,
      'description': description,
      'id': id,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      tital: map['tital'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  List<Object?> get props =>
      [tital, description, id, date, isDone, isDeleted, isFavorite];
}
