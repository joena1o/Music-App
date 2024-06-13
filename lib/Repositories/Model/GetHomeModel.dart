import 'dart:convert';

class GetHomeModel {
  Results? results;

  GetHomeModel({
    this.results,
  });

  factory GetHomeModel.fromRawJson(String str) => GetHomeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetHomeModel.fromJson(Map<String, dynamic> json) => GetHomeModel(
    results: json["results"] == null ? null : Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results?.toJson(),
  };
}

class Results {
  List<QuickPick>? quickPicks;
  MusicThisYear? musicThisYear;
  List<NewReleaseAlbum>? newReleaseAlbums;
  Charts? charts;
  List<MoodAndGenre>? moodAndGenres;

  Results({
    this.quickPicks,
    this.musicThisYear,
    this.newReleaseAlbums,
    this.charts,
    this.moodAndGenres,
  });

  factory Results.fromRawJson(String str) => Results.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    quickPicks: json["quick_picks"] == null ? [] : List<QuickPick>.from(json["quick_picks"]!.map((x) => QuickPick.fromJson(x))),
    musicThisYear: json["music_this_year"] == null ? null : MusicThisYear.fromJson(json["music_this_year"]),
    newReleaseAlbums: json["new_release_albums"] == null ? [] : List<NewReleaseAlbum>.from(json["new_release_albums"]!.map((x) => NewReleaseAlbum.fromJson(x))),
    charts: json["charts"] == null ? null : Charts.fromJson(json["charts"]),
    moodAndGenres: json["mood_and_genres"] == null ? [] : List<MoodAndGenre>.from(json["mood_and_genres"]!.map((x) => MoodAndGenre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "quick_picks": quickPicks == null ? [] : List<dynamic>.from(quickPicks!.map((x) => x.toJson())),
    "music_this_year": musicThisYear?.toJson(),
    "new_release_albums": newReleaseAlbums == null ? [] : List<dynamic>.from(newReleaseAlbums!.map((x) => x.toJson())),
    "charts": charts?.toJson(),
    "mood_and_genres": moodAndGenres == null ? [] : List<dynamic>.from(moodAndGenres!.map((x) => x.toJson())),
  };
}

class Charts {
  TopMusicVideo? topMusicVideo;
  TopArtist? topArtist;

  Charts({
    this.topMusicVideo,
    this.topArtist,
  });

  factory Charts.fromRawJson(String str) => Charts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Charts.fromJson(Map<String, dynamic> json) => Charts(
    topMusicVideo: json["top_music_video"] == null ? null : TopMusicVideo.fromJson(json["top_music_video"]),
    topArtist: json["top_artist"] == null ? null : TopArtist.fromJson(json["top_artist"]),
  );

  Map<String, dynamic> toJson() => {
    "top_music_video": topMusicVideo?.toJson(),
    "top_artist": topArtist?.toJson(),
  };
}

class TopArtist {
  HeaderElement? header;
  List<TopArtistList>? list;

  TopArtist({
    this.header,
    this.list,
  });

  factory TopArtist.fromRawJson(String str) => TopArtist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopArtist.fromJson(Map<String, dynamic> json) => TopArtist(
    header: json["header"] == null ? null : HeaderElement.fromJson(json["header"]),
    list: json["list"] == null ? [] : List<TopArtistList>.from(json["list"]!.map((x) => TopArtistList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "header": header?.toJson(),
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class HeaderElement {
  String? text;

  HeaderElement({
    this.text,
  });

  factory HeaderElement.fromRawJson(String str) => HeaderElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HeaderElement.fromJson(Map<String, dynamic> json) => HeaderElement(
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
  };
}

class TopArtistList {
  String? channelId;
  String? title;
  String? thumbnail;
  String? subscriberText;
  String? customIndexColumn;
  bool? isNeutral;
  bool? isDropUp;
  bool? isDropDown;
  String? videoId;
  String? subtitle;

  TopArtistList({
    this.channelId,
    this.title,
    this.thumbnail,
    this.subscriberText,
    this.customIndexColumn,
    this.isNeutral,
    this.isDropUp,
    this.isDropDown,
    this.videoId,
    this.subtitle,
  });

  factory TopArtistList.fromRawJson(String str) => TopArtistList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopArtistList.fromJson(Map<String, dynamic> json) => TopArtistList(
    channelId: json["channelId"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    subscriberText: json["subscriberText"],
    customIndexColumn: json["customIndexColumn"],
    isNeutral: json["isNeutral"],
    isDropUp: json["isDropUp"],
    isDropDown: json["isDropDown"],
    videoId: json["videoId"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "title": title,
    "thumbnail": thumbnail,
    "subscriberText": subscriberText,
    "customIndexColumn": customIndexColumn,
    "isNeutral": isNeutral,
    "isDropUp": isDropUp,
    "isDropDown": isDropDown,
    "videoId": videoId,
    "subtitle": subtitle,
  };
}

class TopMusicVideo {
  TopMusicVideoHeader? header;
  List<TopArtistList>? list;

  TopMusicVideo({
    this.header,
    this.list,
  });

  factory TopMusicVideo.fromRawJson(String str) => TopMusicVideo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopMusicVideo.fromJson(Map<String, dynamic> json) => TopMusicVideo(
    header: json["header"] == null ? null : TopMusicVideoHeader.fromJson(json["header"]),
    list: json["list"] == null ? [] : List<TopArtistList>.from(json["list"]!.map((x) => TopArtistList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "header": header?.toJson(),
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class TopMusicVideoHeader {
  String? text;
  NavigationEndpoint? navigationEndpoint;

  TopMusicVideoHeader({
    this.text,
    this.navigationEndpoint,
  });

  factory TopMusicVideoHeader.fromRawJson(String str) => TopMusicVideoHeader.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopMusicVideoHeader.fromJson(Map<String, dynamic> json) => TopMusicVideoHeader(
    text: json["text"],
    navigationEndpoint: json["navigationEndpoint"] == null ? null : NavigationEndpoint.fromJson(json["navigationEndpoint"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "navigationEndpoint": navigationEndpoint?.toJson(),
  };
}

class NavigationEndpoint {
  String? clickTrackingParams;
  NavigationEndpointBrowseEndpoint? browseEndpoint;

  NavigationEndpoint({
    this.clickTrackingParams,
    this.browseEndpoint,
  });

  factory NavigationEndpoint.fromRawJson(String str) => NavigationEndpoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NavigationEndpoint.fromJson(Map<String, dynamic> json) => NavigationEndpoint(
    clickTrackingParams: json["clickTrackingParams"],
    browseEndpoint: json["browseEndpoint"] == null ? null : NavigationEndpointBrowseEndpoint.fromJson(json["browseEndpoint"]),
  );

  Map<String, dynamic> toJson() => {
    "clickTrackingParams": clickTrackingParams,
    "browseEndpoint": browseEndpoint?.toJson(),
  };
}

class NavigationEndpointBrowseEndpoint {
  String? browseId;
  BrowseEndpointContextSupportedConfigs? browseEndpointContextSupportedConfigs;

  NavigationEndpointBrowseEndpoint({
    this.browseId,
    this.browseEndpointContextSupportedConfigs,
  });

  factory NavigationEndpointBrowseEndpoint.fromRawJson(String str) => NavigationEndpointBrowseEndpoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NavigationEndpointBrowseEndpoint.fromJson(Map<String, dynamic> json) => NavigationEndpointBrowseEndpoint(
    browseId: json["browseId"],
    browseEndpointContextSupportedConfigs: json["browseEndpointContextSupportedConfigs"] == null ? null : BrowseEndpointContextSupportedConfigs.fromJson(json["browseEndpointContextSupportedConfigs"]),
  );

  Map<String, dynamic> toJson() => {
    "browseId": browseId,
    "browseEndpointContextSupportedConfigs": browseEndpointContextSupportedConfigs?.toJson(),
  };
}

class BrowseEndpointContextSupportedConfigs {
  BrowseEndpointContextMusicConfig? browseEndpointContextMusicConfig;

  BrowseEndpointContextSupportedConfigs({
    this.browseEndpointContextMusicConfig,
  });

  factory BrowseEndpointContextSupportedConfigs.fromRawJson(String str) => BrowseEndpointContextSupportedConfigs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrowseEndpointContextSupportedConfigs.fromJson(Map<String, dynamic> json) => BrowseEndpointContextSupportedConfigs(
    browseEndpointContextMusicConfig: json["browseEndpointContextMusicConfig"] == null ? null : BrowseEndpointContextMusicConfig.fromJson(json["browseEndpointContextMusicConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "browseEndpointContextMusicConfig": browseEndpointContextMusicConfig?.toJson(),
  };
}

class BrowseEndpointContextMusicConfig {
  String? pageType;

  BrowseEndpointContextMusicConfig({
    this.pageType,
  });

  factory BrowseEndpointContextMusicConfig.fromRawJson(String str) => BrowseEndpointContextMusicConfig.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrowseEndpointContextMusicConfig.fromJson(Map<String, dynamic> json) => BrowseEndpointContextMusicConfig(
    pageType: json["pageType"],
  );

  Map<String, dynamic> toJson() => {
    "pageType": pageType,
  };
}

class MoodAndGenre {
  GridRenderer? gridRenderer;

  MoodAndGenre({
    this.gridRenderer,
  });

  factory MoodAndGenre.fromRawJson(String str) => MoodAndGenre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoodAndGenre.fromJson(Map<String, dynamic> json) => MoodAndGenre(
    gridRenderer: json["gridRenderer"] == null ? null : GridRenderer.fromJson(json["gridRenderer"]),
  );

  Map<String, dynamic> toJson() => {
    "gridRenderer": gridRenderer?.toJson(),
  };
}

class GridRenderer {
  List<Item>? items;
  String? trackingParams;
  String? itemSize;
  GridRendererHeader? header;

  GridRenderer({
    this.items,
    this.trackingParams,
    this.itemSize,
    this.header,
  });

  factory GridRenderer.fromRawJson(String str) => GridRenderer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GridRenderer.fromJson(Map<String, dynamic> json) => GridRenderer(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    trackingParams: json["trackingParams"],
    itemSize: json["itemSize"],
    header: json["header"] == null ? null : GridRendererHeader.fromJson(json["header"]),
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "trackingParams": trackingParams,
    "itemSize": itemSize,
    "header": header?.toJson(),
  };
}

class GridRendererHeader {
  GridHeaderRenderer? gridHeaderRenderer;

  GridRendererHeader({
    this.gridHeaderRenderer,
  });

  factory GridRendererHeader.fromRawJson(String str) => GridRendererHeader.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GridRendererHeader.fromJson(Map<String, dynamic> json) => GridRendererHeader(
    gridHeaderRenderer: json["gridHeaderRenderer"] == null ? null : GridHeaderRenderer.fromJson(json["gridHeaderRenderer"]),
  );

  Map<String, dynamic> toJson() => {
    "gridHeaderRenderer": gridHeaderRenderer?.toJson(),
  };
}

class GridHeaderRenderer {
  Title? title;

  GridHeaderRenderer({
    this.title,
  });

  factory GridHeaderRenderer.fromRawJson(String str) => GridHeaderRenderer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GridHeaderRenderer.fromJson(Map<String, dynamic> json) => GridHeaderRenderer(
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title?.toJson(),
  };
}

class Title {
  List<HeaderElement>? runs;

  Title({
    this.runs,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    runs: json["runs"] == null ? [] : List<HeaderElement>.from(json["runs"]!.map((x) => HeaderElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "runs": runs == null ? [] : List<dynamic>.from(runs!.map((x) => x.toJson())),
  };
}

class Item {
  MusicNavigationButtonRenderer? musicNavigationButtonRenderer;

  Item({
    this.musicNavigationButtonRenderer,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    musicNavigationButtonRenderer: json["musicNavigationButtonRenderer"] == null ? null : MusicNavigationButtonRenderer.fromJson(json["musicNavigationButtonRenderer"]),
  );

  Map<String, dynamic> toJson() => {
    "musicNavigationButtonRenderer": musicNavigationButtonRenderer?.toJson(),
  };
}

class MusicNavigationButtonRenderer {
  Title? buttonText;
  Solid? solid;
  ClickCommand? clickCommand;
  String? trackingParams;

  MusicNavigationButtonRenderer({
    this.buttonText,
    this.solid,
    this.clickCommand,
    this.trackingParams,
  });

  factory MusicNavigationButtonRenderer.fromRawJson(String str) => MusicNavigationButtonRenderer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicNavigationButtonRenderer.fromJson(Map<String, dynamic> json) => MusicNavigationButtonRenderer(
    buttonText: json["buttonText"] == null ? null : Title.fromJson(json["buttonText"]),
    solid: json["solid"] == null ? null : Solid.fromJson(json["solid"]),
    clickCommand: json["clickCommand"] == null ? null : ClickCommand.fromJson(json["clickCommand"]),
    trackingParams: json["trackingParams"],
  );

  Map<String, dynamic> toJson() => {
    "buttonText": buttonText?.toJson(),
    "solid": solid?.toJson(),
    "clickCommand": clickCommand?.toJson(),
    "trackingParams": trackingParams,
  };
}

class ClickCommand {
  String? clickTrackingParams;
  ClickCommandBrowseEndpoint? browseEndpoint;

  ClickCommand({
    this.clickTrackingParams,
    this.browseEndpoint,
  });

  factory ClickCommand.fromRawJson(String str) => ClickCommand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClickCommand.fromJson(Map<String, dynamic> json) => ClickCommand(
    clickTrackingParams: json["clickTrackingParams"],
    browseEndpoint: json["browseEndpoint"] == null ? null : ClickCommandBrowseEndpoint.fromJson(json["browseEndpoint"]),
  );

  Map<String, dynamic> toJson() => {
    "clickTrackingParams": clickTrackingParams,
    "browseEndpoint": browseEndpoint?.toJson(),
  };
}

class ClickCommandBrowseEndpoint {
  BrowseId? browseId;
  String? params;

  ClickCommandBrowseEndpoint({
    this.browseId,
    this.params,
  });

  factory ClickCommandBrowseEndpoint.fromRawJson(String str) => ClickCommandBrowseEndpoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClickCommandBrowseEndpoint.fromJson(Map<String, dynamic> json) => ClickCommandBrowseEndpoint(
    browseId: browseIdValues.map[json["browseId"]]!,
    params: json["params"],
  );

  Map<String, dynamic> toJson() => {
    "browseId": browseIdValues.reverse[browseId],
    "params": params,
  };
}

enum BrowseId {
  F_EMUSIC_MOODS_AND_GENRES_CATEGORY
}

final browseIdValues = EnumValues({
  "FEmusic_moods_and_genres_category": BrowseId.F_EMUSIC_MOODS_AND_GENRES_CATEGORY
});

class Solid {
  int? leftStripeColor;

  Solid({
    this.leftStripeColor,
  });

  factory Solid.fromRawJson(String str) => Solid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Solid.fromJson(Map<String, dynamic> json) => Solid(
    leftStripeColor: json["leftStripeColor"],
  );

  Map<String, dynamic> toJson() => {
    "leftStripeColor": leftStripeColor,
  };
}

class MusicThisYear {
  String? title;
  String? strapline;
  List<MusicThisYearList>? list;

  MusicThisYear({
    this.title,
    this.strapline,
    this.list,
  });

  factory MusicThisYear.fromRawJson(String str) => MusicThisYear.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicThisYear.fromJson(Map<String, dynamic> json) => MusicThisYear(
    title: json["title"],
    strapline: json["strapline"],
    list: json["list"] == null ? [] : List<MusicThisYearList>.from(json["list"]!.map((x) => MusicThisYearList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "strapline": strapline,
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class MusicThisYearList {
  String? playlistId;
  String? title;
  String? thumbnail;
  String? subtitle;

  MusicThisYearList({
    this.playlistId,
    this.title,
    this.thumbnail,
    this.subtitle,
  });

  factory MusicThisYearList.fromRawJson(String str) => MusicThisYearList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicThisYearList.fromJson(Map<String, dynamic> json) => MusicThisYearList(
    playlistId: json["playlistId"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toJson() => {
    "playlistId": playlistId,
    "title": title,
    "thumbnail": thumbnail,
    "subtitle": subtitle,
  };
}

class NewReleaseAlbum {
  String? browseId;
  String? title;
  String? thumbnail;
  String? subtitle;
  String? playlistId;
  bool? isExplicit;

  NewReleaseAlbum({
    this.browseId,
    this.title,
    this.thumbnail,
    this.subtitle,
    this.playlistId,
    this.isExplicit,
  });

  factory NewReleaseAlbum.fromRawJson(String str) => NewReleaseAlbum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewReleaseAlbum.fromJson(Map<String, dynamic> json) => NewReleaseAlbum(
    browseId: json["browseId"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    subtitle: json["subtitle"],
    playlistId: json["playlistId"],
    isExplicit: json["isExplicit"],
  );

  Map<String, dynamic> toJson() => {
    "browseId": browseId,
    "title": title,
    "thumbnail": thumbnail,
    "subtitle": subtitle,
    "playlistId": playlistId,
    "isExplicit": isExplicit,
  };
}

class QuickPick {
  String? videoId;
  String? title;
  String? thumbnail;
  String? author;
  bool? isExplicit;

  QuickPick({
    this.videoId,
    this.title,
    this.thumbnail,
    this.author,
    this.isExplicit,
  });

  factory QuickPick.fromRawJson(String str) => QuickPick.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuickPick.fromJson(Map<String, dynamic> json) => QuickPick(
    videoId: json["videoId"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    author: json["author"],
    isExplicit: json["isExplicit"],
  );

  Map<String, dynamic> toJson() => {
    "videoId": videoId,
    "title": title,
    "thumbnail": thumbnail,
    "author": author,
    "isExplicit": isExplicit,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
