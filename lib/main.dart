import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/Authentication/wrapper.dart';
import 'package:moneycontrol/pages/2first_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Supabase Connectivity
  await Supabase.initialize(
    url: "https://zguaiaawhzpemssanxjk.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpndWFpYWF3aHpwZW1zc2FueGprIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTA4NDk3MDAsImV4cCI6MjA2NjQyNTcwMH0.BaIBSYjyU0FJlDKknTjaEFVtRySKe6GzhaGA95ce6cc",
  );

  // Firebase Connectivity
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Portfolio App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const wrapper()
    );
  }
}
