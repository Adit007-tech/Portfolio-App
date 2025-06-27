import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authentication/auth_service.dart';


class profile_page extends StatefulWidget{
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  final _auth_service = auth_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              Container(width: 130,height: 130,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 5),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(1)
                      )
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4867.jpg"))
                ),),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(_auth_service.getUserEmail().toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Column(
                children: [
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.info,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => personinfo_page()));
                          },
                            child: Text("Peronal Info",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.picture_as_pdf,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => personinfo_page()));
                          },
                            child: Text("Resume pdf",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.work_history,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => add_project_page()));
                          },
                            child: Text("Working Projects",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.podcasts_sharp,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => add_post_page()));
                          },
                            child: Text("Posts",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.gite,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => personinfo_page()));
                          },
                            child: Text("GitHub Repository",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                      width: 320,height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(1)
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.logout,color: Colors.white,),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          TextButton(onPressed: (){
                            _auth_service.signOut();
                          },
                            child: Text("Sign Out",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              )
            ],
          ),

        ),
      ),

    );

  }
}