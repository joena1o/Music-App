import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Repositories/Model/GetHomeModel.dart';
import 'package:music_app/font-styles.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart' hide ProgressBar;

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key, required this.item}) : super(key: key);

  final QuickPick item;

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  YoutubePlayerController? _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  QuickPick? musicItem;

  Duration? progressSoFar;


  @override
  void initState() {

    // TODO: implement initState

    super.initState();

    musicItem = widget.item;

    _controller = YoutubePlayerController(
      initialVideoId: musicItem!.videoId.toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(listener);

    Provider.of<HomePageProvider>(context, listen: false).getMusicInfo(musicItem!.videoId);

    Provider.of<HomePageProvider>(context, listen: false).getMusicLyrics(musicItem!.videoId);

  }

  void listener() {
      setState(() {
        _playerState = _controller!.value.playerState;
        _videoMetaData = _controller!.metadata;
      });
      progressSoFar = _controller!.value.position;
  }

  @override
  void deactivate() {
    _controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        foregroundColor: Colors.white54,
        elevation: 0,
        backgroundColor: background,
        title: const Text("Now Playing"),
        centerTitle: true,
        actions: [
            IconButton(onPressed: (){

            }, icon: const Icon(Iconsax.more)),
          const SizedBox(width: 10,)
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              const SizedBox(height: 50,),

              SizedBox(
                width: 0,
                height: 0,
                child: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,
                ),
              ),


              SizedBox(
                width: size.width*.7,
                height: size.height*.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      musicItem!.thumbnail.toString(),
                      fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(musicItem!.title.toString(), textAlign: TextAlign.center, style: whiteMedium,),
              ),
              Text(musicItem!.author.toString(), style: whiteRegular,),


               const SizedBox(height: 30,),

              Consumer<HomePageProvider>(builder: (context, dataModel, child) {
                return !dataModel.isLoadingMusicInfo ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 25),
                    child: ProgressBar(
                      progress: progressSoFar!,
                      buffered: const Duration(milliseconds: 2000),
                      total: Duration(seconds: dataModel.musicInfoModel!.duration!),
                      timeLabelType: TimeLabelType.remainingTime,
                      onSeek: (duration) {
                        print('User selected a new time: $duration');
                      },
                    ),
                  ) : Container();
                }
              ),


              Consumer<HomePageProvider>(builder: (context, dataModel, child) {
                    return !dataModel.isLoadingMusicInfo ? Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:  [

                         const CircleAvatar(
                           child: Icon(Iconsax.arrow_left_2),
                         ),

                         const SizedBox(width: 20,),

                         GestureDetector(
                           onTap:(){

                             _controller!.value.isPlaying
                                 ? _controller!.pause()
                                 : _controller!.play();

                            },
                           child: CircleAvatar(
                             radius: 35,
                             child: playerState()
                           ),
                         ),

                         const SizedBox(width: 20,),

                         const CircleAvatar(
                           child: Icon(Iconsax.arrow_right_3),
                         )

                       ],
                     ): Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    );
                }
              ),

              const SizedBox(height: 20,),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: size.width,
                height: size.height*.5,
                child: Column(
                  children: [

                    const Align(
                      alignment: Alignment.centerRight,
                      child:  CircleAvatar(
                        child: Icon(Icons.fullscreen),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Consumer<HomePageProvider>(builder: (context, dataModel, child) {
                      return Expanded(
                        child: ListView(
                        children:  [
                          !dataModel.isLoadingMusicLyrics ?
                          dataModel.musicLyricsModel!.description != null ?
                          Text(dataModel.musicLyricsModel?.description?.text ?? "",
                            style: blackRegular,
                            overflow: TextOverflow.fade,) : Container() : const Center(
                              child: CircularProgressIndicator(),
                          ) ,

                        ],
                    ),
                      ); }),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget playerState(){
    if(_playerState == PlayerState.playing){
      return const Icon(
          Iconsax.pause
      );
    }else if(_playerState == PlayerState.unknown || _playerState == PlayerState.buffering){
      return const CircularProgressIndicator();
    }else{
      return const Icon(
          Iconsax.play
      );
    }
  }

}
