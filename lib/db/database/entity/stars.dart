import 'package:floor/floor.dart';

import 'history.dart';

@Entity(tableName: "stars")
class Stars {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String title;
  final String? hint;
  final String? url;
  final String? image;
  final String? gaPrefix;
  final String? readingTime;

  Stars({
    this.id,
    required this.title,
    this.hint,
    this.url,
    this.image,
    this.gaPrefix,
    this.readingTime,
  });

  History toHistory(String readingTime) {
    return History(
      id: id,
      title: title,
      hint: hint,
      url: url,
      image: image,
      gaPrefix: gaPrefix,
      readingTime: readingTime,
    );
  }
}
