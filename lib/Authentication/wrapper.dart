import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/pages/3login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/5home_page.dart';

class wrapper extends StatefulWidget{
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Supabase.instance.client.auth.onAuthStateChange,
          builder: (context,snapshot){
            // loading
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // check if there is valid session
            final session = snapshot.hasData ? snapshot.data!.session : null;

              if(session != null){
                return const home_page();
              }else{
                return  const login_page();
              }
            }
          ),
    );
  }
}