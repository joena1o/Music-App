import 'package:flutter/material.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Screens/AlbumPage.dart';
import 'package:provider/provider.dart';

class Albums extends StatefulWidget {
  const Albums({Key? key}) : super(key: key);

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<HomePageProvider>(builder: (context, dataModel, child) {
      return !dataModel.isLoadingHomeInfo ? SizedBox(
          width: size.width,
          height: size.height*.33,

          child: SizedBox(
          width: size.width,
          height: size.height*.24,

          child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext ctx, i){

            final thumbnail = dataModel.homeModel!.results!.newReleaseAlbums![i].thumbnail.toString();
            final item = dataModel.homeModel!.results!.newReleaseAlbums![i];

            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> AlbumPage(item: item,))
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: size.width*.38,
                    height: size.height*.18,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                   Container(
                     width: size.width*.38,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Wrap(
                      children: [
                        Text(item.title.toString(), style: const TextStyle(
                          color: Colors.white
                        ),),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Container(
                    width: size.width*.38,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Wrap(
                      children: [
                        Text(item.subtitle.toString(), style: const TextStyle(
                            color: Colors.grey, fontSize: 12
                        ),),
                      ],
                    ),
                  )

                ],
              ),
            );
          },
        )
      )): const Center(child:CircularProgressIndicator());
    });
  }
}
