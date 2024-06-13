import 'dart:convert';

class SearchResultModel {
  List<Result>? result;
  String? nextPageToken;

  SearchResultModel({
    this.result,
    this.nextPageToken,
  });

  factory SearchResultModel.fromRawJson(String str) => SearchResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    nextPageToken: json["nextPageToken"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "nextPageToken": nextPageToken,
  };
}

class Result {
  String? videoId;
  String? title;
  String? thumbnail;
  String? author;
  String? duration;
  bool? isExplicit;
  bool? isMusic;

  Result({
    this.videoId,
    this.title,
    this.thumbnail,
    this.author,
    this.duration,
    this.isExplicit,
    this.isMusic,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    videoId: json["videoId"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    author: json["author"],
    duration: json["duration"],
    isExplicit: json["isExplicit"],
    isMusic: json["isMusic"],
  );

  Map<String, dynamic> toJson() => {
    "videoId": videoId,
    "title": title,
    "thumbnail": thumbnail,
    "author": author,
    "duration": duration,
    "isExplicit": isExplicit,
    "isMusic": isMusic,
  };
}

