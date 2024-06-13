import 'package:flutter/material.dart';
import 'package:music_app/Provider/HomePageProvider.dart';
import 'package:music_app/Provider/ThemeProvider.dart';
import 'package:music_app/Screens/IntroScreen.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pjiajdfewbiipdbghvro.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqaWFqZGZld2JpaXBkYmdodnJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc0ODk4NzksImV4cCI6MjAyMzA2NTg3OX0.rOkGiAG87x5MMF-djr0q-f5EdQ-fEcdHs70c-OQr_uo',
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HomePageProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeProvider>().themeData,
      home:  const IntroScreen(),
    );
  }
}
