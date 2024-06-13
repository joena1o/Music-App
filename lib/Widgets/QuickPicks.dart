import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Screens/MusicScreen.dart';
import 'package:provider/provider.dart';

class QuickPicks extends StatefulWidget {
  const QuickPicks({Key? key}) : super(key: key);

  @override
  State<QuickPicks> createState() => _QuickPicksState();
}

class _QuickPicksState extends State<QuickPicks> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Consumer<HomePageProvider>(builder: (context, dataModel, child) {

      return !dataModel.isLoadingHomeInfo ? SizedBox(
        width: size.width,
        height: size.height*.25,
        child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataModel.homeModel?.results?.quickPicks!.length,
        itemBuilder: (BuildContext ctx, i){

                  final thumbnail = dataModel.homeModel!.results!.quickPicks![i].thumbnail.toString();
                  final item = dataModel.homeModel!.results!.quickPicks![i];

                  return  Stack(
                    children: [

                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: size.width*.5,
                        height: size.height*.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 12.0,
                                sigmaY: 15.0,
                              ),
                              child:Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  height: 78,
                                  width: size.width*.5,
                                  padding: const EdgeInsets.only(left: 10, right: 5, bottom: 20),
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(item.title.toString(), style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height: 5,),
                                      Text(item.author.toString(), style: const TextStyle(color: Colors.white54))
                                    ],
                                  )
                        ),
                      ))),


                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_)=> MusicScreen(item: item,))
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Icon(Iconsax.play, color: Colors.white,),
                          ),
                        ),
                      ),


                 ],
              );
           },
        )): const Center(child:CircularProgressIndicator());
      }
    );
  }
}
