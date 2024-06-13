import 'package:flutter/cupertino.dart';
import 'package:music_app/Repositories/ApiServices/YoutubeApiService.dart';
import 'package:music_app/Repositories/Model/AlbumDetailsAlbum.dart';
import 'package:music_app/Repositories/Model/GetHomeModel.dart';
import 'package:music_app/Repositories/Model/MusicInfoModel.dart';
import 'package:music_app/Repositories/Model/MusicLyricsModel.dart';
import 'package:music_app/Repositories/Model/SearchResultModel.dart';

class HomePageProvider extends ChangeNotifier{

  YoutubeApiService ytApiService = YoutubeApiService();

  GetHomeModel? homeModel;
  MusicInfoModel? musicInfoModel;
  MusicLyricsModel? musicLyricsModel;
  SearchResultModel? searchResultModel;

  //For Albums
  Map<String, dynamic>? albumDetails;
  List<AlbumDetailsModel>? albumList;

  bool loadingHomeInfo = false;
  bool get isLoadingHomeInfo => loadingHomeInfo;

  bool loadingMusicInfo = false;
  bool get isLoadingMusicInfo => loadingMusicInfo;

  bool loadingMusicLyrics = false;
  bool get isLoadingMusicLyrics => loadingMusicLyrics;

  bool loadingAlbumInfo = false;
  bool get isLoadingAlbumInfo => loadingAlbumInfo;

  bool loadingSearchResult = false;
  bool get isLoadingSearchResult => loadingSearchResult;

  TextEditingController searchController = TextEditingController();


  void getHomeInfo() async{
    final queryParams = {"gl": 'NG'};
    loadingHomeInfo = true;
    try{
      homeModel = await ytApiService.getHomeData(queryParams);
    }catch(e){
      print(e);
    }finally{
      loadingHomeInfo = false;
    }
    notifyListeners();
  }

  void getMusicInfo(musicId) async{
    final queryParams = {'id': musicId};
    loadingMusicInfo = true;
    try{
      musicInfoModel = await ytApiService.getMusicInfo(queryParams);
    }catch(e){
      print(e);
    }finally{
      loadingMusicInfo = false;
    }
    notifyListeners();
  }


  void getMusicLyrics(musicId) async{
    final queryParams = {'id': musicId};
    loadingMusicLyrics = true;
    try{
      musicLyricsModel = await ytApiService.getMusicLyrics(queryParams);
    }catch(e){
      print(e);
    }finally{
      loadingMusicLyrics = false;
    }
    notifyListeners();
  }

  void getAlbumInfo(albumId) async{
    final queryParams = {'id': albumId};
    loadingAlbumInfo = true;
    albumList = [];
    try{
      albumDetails = await ytApiService.getAlbumInfo(queryParams);
      print(albumDetails!['results']);
      albumList = (albumDetails!['results'] as List<dynamic>).map((x) => AlbumDetailsModel.fromJson(x)).toList();
    }catch(e){
      print(e);
    }finally{
      loadingAlbumInfo = false;
    }
    notifyListeners();
  }

  void searchMusic() async{
    if(searchController.text.isEmpty){
      return;
    }
    final queryParams = {
      "q": searchController.text.toString(),
      "type": 'song'
    };
    loadingSearchResult = true;
    try{
      searchResultModel = await ytApiService.searchMusic(queryParams);
    }catch(e){
      print(e);
    }finally{
      loadingSearchResult = false;
    }
    notifyListeners();
  }

}