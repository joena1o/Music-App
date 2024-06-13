import 'package:flutter/material.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Repositories/Model/AlbumDetailsAlbum.dart';
import 'package:music_app/Repositories/Model/GetHomeModel.dart';
import 'package:music_app/Screens/MusicScreen.dart';
import 'package:music_app/font-styles.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.item}) : super(key: key);

  final NewReleaseAlbum item;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {

  NewReleaseAlbum? album;
  AlbumDetailsModel? currentTrack;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    album = widget.item;

    Provider.of<HomePageProvider>(context, listen: false).getAlbumInfo(album!.browseId);

  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leadingWidth: 60,
                  leading: Padding(
                      padding: const  EdgeInsets.only(left: 20),
                      child:CircleAvatar(
                          backgroundColor: background,
                          child:IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon:  const Icon(Icons.arrow_back_rounded, size: 25,)
                          ))),
                  expandedHeight: size.height*.3,
                  backgroundColor: background,
                  elevation: 0,
                  foregroundColor: Colors.grey,
                  floating: true,
                  pinned: true,
                  actions: [
                    CircleAvatar(
                        backgroundColor: background,
                        child:IconButton(onPressed: (){

                        }, icon:  const Icon(Icons.favorite_outline, size: 25,)
                        )),

                    Container(width: 10,),

                    GestureDetector(
                      onLongPressDown: (start){

                      },
                      child: CircleAvatar(
                          backgroundColor: background,
                          child:IconButton(onPressed: (){

                          }, icon:  const Icon(Icons.share, size: 25,)
                          )),
                    ),

                    Container(width: 20,)
                  ],
                  flexibleSpace:  FlexibleSpaceBar(
                      centerTitle: true,
                      background:  Image.network(
                        album!.thumbnail.toString(),
                        fit: BoxFit.cover,
                      ),
                  ),
                )];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: Text(album!.title.toString(), style: whiteMedium,),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                    child: Text(album!.subtitle.toString(), style: whiteRegular,),
                  ),

                  const SizedBox(height: 20,),


                  Consumer<HomePageProvider>(builder: (context, dataModel, child) {
                    return !dataModel.isLoadingAlbumInfo ? Column(

                              children: List.generate(dataModel.albumList!.length, (index){
                              final albumItem = dataModel.albumList![index];

                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                width: size.width,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (_)=> MusicScreen(item: QuickPick(
                                          title: albumItem.title.toString(), videoId: albumItem.videoId.toString(),
                                          author: albumItem.author.toString(), thumbnail: albumItem.thumbnail.toString()
                                        ),))
                                    );
                                  },
                                  child: ListTile(
                                    minVerticalPadding: 10,
                                    leading: Text((index+1).toString(), style: greyRegular,),
                                    title: Text(albumItem.title.toString(), style: greyRegular,),
                                    subtitle: Text(albumItem.author.toString(), style: whiteSmall,),
                                    trailing: Text(albumItem.duration.toString(), style: whiteSmall,),

                                  ),
                                ),
                              );
                            }),

                          ):Container(
                              margin: const EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }
                         )



                ],

              ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          child: const Icon(Icons.play_arrow),
        ),
    );
  }
}
