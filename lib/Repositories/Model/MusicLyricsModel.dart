import 'dart:convert';

class MusicLyricsModel {
  String? type;
  Description? description;
  int? maxCollapsedLines;
  int? maxExpandedLines;
  Description? footer;

  MusicLyricsModel({
    this.type,
    this.description,
    this.maxCollapsedLines,
    this.maxExpandedLines,
    this.footer,
  });

  factory MusicLyricsModel.fromRawJson(String str) => MusicLyricsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicLyricsModel.fromJson(Map<String, dynamic> json) => MusicLyricsModel(
    type: json["type"],
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    maxCollapsedLines: json["max_collapsed_lines"],
    maxExpandedLines: json["max_expanded_lines"],
    footer: json["footer"] == null ? null : Description.fromJson(json["footer"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "description": description?.toJson(),
    "max_collapsed_lines": maxCollapsedLines,
    "max_expanded_lines": maxExpandedLines,
    "footer": footer?.toJson(),
  };
}

class Description {
  String? text;
  List<Run>? runs;

  Description({
    this.text,
    this.runs,
  });

  factory Description.fromRawJson(String str) => Description.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    text: json["text"],
    runs: json["runs"] == null ? [] : List<Run>.from(json["runs"]!.map((x) => Run.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "runs": runs == null ? [] : List<dynamic>.from(runs!.map((x) => x.toJson())),
  };
}

class Run {
  String? text;
  bool? bold;
  bool? italics;
  bool? strikethrough;

  Run({
    this.text,
    this.bold,
    this.italics,
    this.strikethrough,
  });

  factory Run.fromRawJson(String str) => Run.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Run.fromJson(Map<String, dynamic> json) => Run(
    text: json["text"],
    bold: json["bold"],
    italics: json["italics"],
    strikethrough: json["strikethrough"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "bold": bold,
    "italics": italics,
    "strikethrough": strikethrough,
  };
}
