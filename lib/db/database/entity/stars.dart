import 'package:floor/floor.dart';

@Entity(tableName: "stars")
class Stars {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String? title;
  final String? hint;
  final String? url;
  final String? image;
  final String? gaPrefix;
  final String? readingTime;

  Stars({
    this.id,
    this.title,
    this.hint,
    this.url,
    this.image,
    this.gaPrefix,
    this.readingTime,
  });
}
