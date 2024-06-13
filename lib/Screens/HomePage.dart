import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Screens/SearchPage.dart';
import 'package:music_app/Widgets/Albums.dart';
import 'package:music_app/Widgets/QuickPicks.dart';
import 'package:music_app/font-styles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<HomePageProvider>(context, listen: false).getHomeInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome", style: TextStyle(color: Colors.grey, fontSize: 17),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SizedBox(
                            width: size.width*.65,
                            child: const Text("Let the music take you away", style: whiteMedium,)),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("assets/Hyefur.png"),
                          ),
                        ),


                      ],
                    ),

                    const SizedBox(height: 30,),

                    Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_)=> const SearchPage())
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: const [

                                  Icon(Iconsax.search_normal),
                                  SizedBox(width: 20,),
                                  Text("Search for song")

                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10,),

                        const Icon(Icons.tune, size: 32, color: Colors.white,)

                      ],
                    ),


                    const SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Quick Picks", style: whiteMedium,),
                        Text("See all", style: TextStyle(color: Colors.grey, fontSize: 17),)
                      ],
                    ),

                  ],
                ),
              ),


              const SizedBox(height: 20,),

              const QuickPicks(),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("New Albums", style: whiteMedium,),
                        Text("See all", style: TextStyle(color: Colors.grey, fontSize: 17),)
                      ],
                    ),



                  ],
                ),
              ),

              const SizedBox(height: 20,),

              const Albums(),

              

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 90,
        color: background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Iconsax.home, color: Colors.orangeAccent,),
            Icon(Iconsax.discover_13, color: Colors.grey,),
            Icon(Iconsax.music, color: Colors.grey,),
            Icon(Iconsax.user,  color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
