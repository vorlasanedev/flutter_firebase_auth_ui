import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_ui/pages/chat_page.dart';
import 'package:flutter_firebase_auth_ui/pages/register_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _redirect();
    });
  }

  Future<void> _redirect() async {
    // small delay
    await Future.delayed(Duration(milliseconds: 300));
    if (!mounted) return; // check if widget is still mounted

    final session = Supabase.instance.client.auth.currentSession;
    if (session == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => RegisterPage()),
        (_) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => ChatPage()),
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
