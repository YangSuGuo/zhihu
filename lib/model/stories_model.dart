import 'dart:convert';

StoriesData storiesDataFromJson(String str) =>
    StoriesData.fromJson(json.decode(str));

StoriesData storiesDataFromJsonInside(String str) =>
    StoriesData.fromJsonInside(json.decode(str));

String storiesDataToJson(StoriesData data) => json.encode(data.toJson());

/// 文章列表
class StoriesData {
  late int? id;
  late String? title;
  late String? hint;
  late String? image;
  late String? url;
  late String? gaPrefix;

  StoriesData({
    this.id,
    this.title,
    this.hint,
    this.image,
    this.url,
    this.gaPrefix,
  });

  factory StoriesData.fromJson(Map<String, dynamic> json) => StoriesData(
        id: json['id'],
        title: json['title'],
        hint: json['hint'],
        image: json['images'][0],
        url: json['url'],
        gaPrefix: json['ga_prefix'],
      );

  factory StoriesData.fromJsonInside(Map<String, dynamic> json) => StoriesData(
        id: json['id'],
        title: json['title'],
        hint: json['hint'],
        image: json['image'],
        url: json['url'],
        gaPrefix: json['ga_prefix'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'hint': hint,
        'image': image,
        'url': url,
        'gaPrefix': gaPrefix
      };
}
