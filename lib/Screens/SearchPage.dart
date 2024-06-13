import 'package:flutter/material.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Repositories/Model/GetHomeModel.dart';
import 'package:music_app/Screens/MusicScreen.dart';
import 'package:music_app/font-styles.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [

            SafeArea(
              bottom: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {}, child: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: context
                                .read<HomePageProvider>()
                                .searchController,
                            decoration: const InputDecoration(
                                hintText: "Search here",
                                border: InputBorder.none),
                            onSubmitted: (value) async {
                              Provider.of<HomePageProvider>(context,
                                      listen: false)
                                  .searchMusic();
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: Consumer<HomePageProvider>(
                  builder: (context, dataModel, child) {
                   return !dataModel.isLoadingSearchResult ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: dataModel.searchResultModel?.result!.length,
                    itemBuilder: (BuildContext ctx, i) {
                      final item = dataModel.searchResultModel?.result![i];
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_)=> MusicScreen(item: QuickPick(
                                videoId: item.videoId, author: item.author, thumbnail: item.thumbnail,
                                isExplicit: item.isExplicit, title: item.title
                              ),))
                          );
                        },
                        child: ListTile(
                          title: Text(item!.title.toString(), style: whiteSmall,),
                          subtitle: Text(item!.author.toString(), style: greyRegular,),
                        ),
                      );
                    }) : const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
