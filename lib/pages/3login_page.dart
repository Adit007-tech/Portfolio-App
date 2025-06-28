import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneycontrol/Authentication/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '4register_page.dart';
import '5home_page.dart';

class login_page extends StatefulWidget{
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {

  final  _auth_service = auth_service();
  bool isloading = false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  // login button pressed

  void login() async{
    try {
      setState(() {
        isloading = true;
      });
    final email = _email.text;
    final password = _password.text;

    // check if email and password are not empty
      if(email.isEmpty || password.isEmpty ){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter all the fields"))
        );
      }else if(!email.contains("@")){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter a valid Email and Password or Email is not Registerd"))
        );
      }
    await _auth_service.signInWithEmailAndPassword(email, password);
    setState(() {
      isloading = false;
    });
    }catch(e){
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Login"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
                    const Text("Login",
                      style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                      ),
                    ),
                    const Text("Login to your account ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      width: 250,
                      child: Column(
                        children: [
                          const Icon(Icons.person,size: 40),
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                                focusColor: Colors.grey,
                                label: Text("Email"),
                                hoverColor: Colors.lightBlue,
                                hintText: "Enter your email"
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          TextFormField(
                            controller: _password,
                            decoration: const InputDecoration(
                                label: Text("Password"),
                                hoverColor: Colors.lightBlue,
                                focusColor: Colors.grey,
                                hintText: "Enter password"
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(top: 50)),
                          MaterialButton(
                              minWidth: 200,
                              height: 40,
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const home_page()));
                                login();
                              }, child: isloading
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text("LOGIN",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),)
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Text("Don't have any account, "),
                              // InkWell work same as GestureDetector
                              GestureDetector(
                                  child: const Text("Don't have any account, SignUp",style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=> const register_page()));
                                  })
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 20)),
                          MaterialButton(
                              minWidth: 200,
                              height: 40,
                              color: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () async {
                                try{
                                  signInWithGoogle();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> const home_page()));
                                }catch(e){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Something went wrong $e"))
                                  );
                                }
                              }, child: const Text("SignIn with Google",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                          )
                        ],
                      ),
                    )
                  ],
                ),
        ),
            ),
    );
  }

  Future<UserCredential> signInWithGoogle() async{

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

