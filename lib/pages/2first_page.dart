import 'package:flutter/material.dart';


import '3login_page.dart';
import '4register_page.dart';

class first_page extends StatelessWidget{
  const first_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 44,
              fontStyle: FontStyle.italic
            ),),
            const Text("Portfolio", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 44,
                fontStyle: FontStyle.italic
            ),),
            Container(
              margin: const EdgeInsets.only(top: 300),
               width: MediaQuery.of(context).size.width,
               child: SizedBox(
                 child: Column(
                   children: [
                      MaterialButton(
                        minWidth: 200,
                        height: 40,
                        color: Colors.lightBlueAccent,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const login_page()));
                        }, child: const Text("Login",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                       ),
                     Container(
                       height: 30,
                     ),
                     MaterialButton(
                       minWidth: 200,
                       height: 40,
                       color: Colors.lightBlueAccent,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         onPressed: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => const register_page()));
                     }, child: const Text("Register",style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 20,
                     ),)),
                   ],
                 ),
               ),
            )
          ],
        ),
      ),


    );
  }

}