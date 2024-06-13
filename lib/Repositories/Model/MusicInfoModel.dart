import 'dart:convert';

class MusicInfoModel {
  String? id;
  String? channelId;
  String? title;
  int? duration;
  bool? isOwnerViewing;

  MusicInfoModel({
    this.id,
    this.channelId,
    this.title,
    this.duration,
    this.isOwnerViewing,
  });

  factory MusicInfoModel.fromRawJson(String str) => MusicInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicInfoModel.fromJson(Map<String, dynamic> json) => MusicInfoModel(
    id: json["id"],
    channelId: json["channel_id"],
    title: json["title"],
    duration: json["duration"],
    isOwnerViewing: json["is_owner_viewing"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "channel_id": channelId,
    "title": title,
    "duration": duration,
    "is_owner_viewing": isOwnerViewing,
  };
}
