import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '7profile.dart';
import 'about_info.dart';
import 'build_add.dart';

class home_page extends StatefulWidget{
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  final List<Widget>  pages = [
    const build_app(),
    const about_info(),
    const profile_page()
  ];
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        title: const Text("Portfolio",style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,

        ),),
      ),
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        currentIndex: currentpage,
          onTap: (value){
          setState(() {
            currentpage = value;
          });
          },
          items: const[
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.build,
                    color: Colors.white,
                ),
              label: "Post",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.info,
                  color: Colors.white,

                ),
              label: "Developer",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                  Icons.person,
                color: Colors.white,
              ),
              label: "Profile",
            ),
          ]),
    );
  }
}