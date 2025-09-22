import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_firebase_auth_ui/pages/splash_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // print('Current directory: ${Directory.current.path}');
  await dotenv.load(fileName: '.env');
  // await dotenv.load(
  //   fileName: '/Users/soulivanh/StudioProjects/flutter_firebase_auth_ui/.env',
  // );
  // print('Loaded env: ${dotenv.env}');

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
