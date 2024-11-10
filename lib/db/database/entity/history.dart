import 'package:floor/floor.dart';

@Entity(tableName: 'history')
class History {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String? hint;
  final String? url;
  final String? image;
  final String? gaPrefix;
  final String? readingTime;

  History({
    this.id,
    required this.title,
    this.hint,
    this.url,
    this.image,
    this.gaPrefix,
    this.readingTime,
  });
}
