import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_app/Repositories/Model/GetHomeModel.dart';
import 'package:music_app/Repositories/Model/MusicInfoModel.dart';
import 'package:music_app/Repositories/Model/MusicLyricsModel.dart';

import '../Model/SearchResultModel.dart';

class YoutubeApiService{

  String baseUrl = "https://youtube-music-api3.p.rapidapi.com";
  Map<String, String> headers =  {
    'X-RapidAPI-Key': '90b83e766amsh1a3ab57e764ad86p1d7e4fjsnebf5068dddbe',
    'X-RapidAPI-Host': 'youtube-music-api3.p.rapidapi.com'
  };

  Future<GetHomeModel> getHomeData(queryParams) async{
    GetHomeModel? getHomeModel;
    try{
      var newUrl = Uri.parse(baseUrl).replace(path: "/home", queryParameters: queryParams);
      final result = await http.get(newUrl, headers: headers,);
      final response = json.decode(result.body) as Map<String, dynamic>;
      getHomeModel = GetHomeModel.fromJson(response);
      return getHomeModel;
    }catch(e){
      rethrow;
    }
  }

  Future<MusicInfoModel> getMusicInfo(queryParams) async{
    MusicInfoModel? musicInfo;
    try{
      var newUrl = Uri.parse(baseUrl).replace(path: "/music/info", queryParameters: queryParams);
      final result = await http.get(newUrl, headers: headers,);
      final response = json.decode(result.body) as Map<String, dynamic>;
      musicInfo = MusicInfoModel.fromJson(response['basic_info']);
      return musicInfo;
    }catch(e){
      rethrow;
    }
  }

  Future<MusicLyricsModel> getMusicLyrics(queryParams) async{
    MusicLyricsModel? musicLyrics;
    try{
      var newUrl = Uri.parse(baseUrl).replace(path: "/music/lyrics/plain", queryParameters: queryParams);
      final result = await http.get(newUrl, headers: headers,);
      print(result.body);
      final response = json.decode(result.body) as Map<String, dynamic>;
      musicLyrics = MusicLyricsModel.fromJson(response);
      return musicLyrics;
    }catch(e){
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAlbumInfo(queryParams) async{
    try{
      var newUrl = Uri.parse(baseUrl).replace(path: "/getAlbum", queryParameters: queryParams);
      final result = await http.get(newUrl, headers: headers,);
      final response = json.decode(result.body) as Map<String, dynamic>;
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<SearchResultModel> searchMusic(queryParams) async{
    SearchResultModel? searchResultModel;
    try{
      var newUrl = Uri.parse(baseUrl).replace(path: "/search", queryParameters: queryParams);
      final result = await http.get(newUrl, headers: headers,);
      print(result.body);
      final response = json.decode(result.body) as Map<String, dynamic>;
      searchResultModel = SearchResultModel.fromJson(response);
      return searchResultModel;
    }catch(e){
      rethrow;
    }
  }

}