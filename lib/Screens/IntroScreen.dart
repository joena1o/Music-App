import 'package:flutter/material.dart';
import 'package:music_app/Screens/HomePage.dart';
import 'package:music_app/font-styles.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(height: 20,),

              const Text("Rhythms", style: yellowLarge,),

              const Text("that Shake your soul", style: whiteLarge,),


              Container(
                width: size.width*.75,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text("Play the music you like explore songs, listen anytime and anywhere now it's easier",
                  style: whiteRegular,),
              ),


              const Expanded(
                child: Image(
                  fit: BoxFit.fitWidth,
                  image: AssetImage("assets/listening.png"),
                ),
              ),



              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=> const HomePage())
                    );
              }, child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent
                  ),
                  child: const Text("Listen Now", style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),))),


              const SizedBox(height: 30,)


            ],
          ),
        ),
      ),
    );
  }
}
