import 'dart:convert';

class AlbumDetailsModel {
  String? videoId;
  String? title;
  String? duration;
  bool? isExplicit;
  String? thumbnail;
  String? author;

  AlbumDetailsModel({
    this.videoId,
    this.title,
    this.duration,
    this.isExplicit,
    this.thumbnail,
    this.author,
  });

  factory AlbumDetailsModel.fromRawJson(String str) => AlbumDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AlbumDetailsModel.fromJson(Map<String, dynamic> json) => AlbumDetailsModel(
    videoId: json["videoId"],
    title: json["title"],
    duration: json["duration"],
    isExplicit: json["isExplicit"],
    thumbnail: json["thumbnail"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "videoId": videoId,
    "title": title,
    "duration": duration,
    "isExplicit": isExplicit,
    "thumbnail": thumbnail,
    "author": author,
  };
}
