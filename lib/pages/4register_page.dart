import 'package:flutter/material.dart';
import 'package:moneycontrol/Authentication/auth_service.dart';
import '5home_page.dart';


class register_page extends StatefulWidget{
  const register_page({super.key});

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {

  bool isloading = false;
  final _auth_service = auth_service();

  // final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmfpassword = TextEditingController();


  // register button
  void signUp() async{
    try{
    setState(() {
      isloading = true;
    });
    final email = _email.text;
    final passowrd = _password.text;
    final confirmPassword = _confirmfpassword.text;

    if(email.isEmpty || passowrd.isEmpty || confirmPassword.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter all fields")));
    }else if(!email.contains("@")){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter valid email and Password")));
    }
    setState(() {
      isloading = false;
    });
    // check if password and confirm password match
    if(passowrd != confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password doesn't match")));
    }

    setState(() {
      isloading = false;
    });
    // attempt to signUp
    if(email != null && passowrd != null){
      await _auth_service.signUpwithEmailAndPassword(email, passowrd);
      Navigator.push(context, MaterialPageRoute(builder: (context) => const home_page()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Unable to Register")));
    }
    setState(() {
      isloading = false;
    });
    }catch(e){
      setState(() {
        isloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      setState(() {
        isloading = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("Registration",style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.blue
          ),),
              Padding(padding: EdgeInsets.only(top: 80)),
              const Text("Create your account",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 250,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          focusColor: Colors.grey,
                          hintText: "Enter your email"
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          label: Text("password"),
                          focusColor: Colors.grey,
                          hintText: "Enter your password"
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    TextFormField(
                      controller: _confirmfpassword,
                      decoration: const InputDecoration(
                          focusColor: Colors.grey,
                          label: Text("Confirm password"),
                          hintText: "Confirm your password"
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 60)),
                    MaterialButton(
                      minWidth: 200,
                      height: 40,
                      color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const home_page()));
                          signUp();
                        }, child: isloading
                        ? const CircularProgressIndicator(color: Colors.white,)
                        : const Text("Register",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}