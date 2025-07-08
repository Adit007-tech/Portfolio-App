import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/service/userApi.dart';
import '../model/user.dart';

class apiIntegration extends StatefulWidget{
  @override
  State<apiIntegration> createState() => _apiIntegrationState();
}

class _apiIntegrationState extends State<apiIntegration> {

  // List of User
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("Api Integration"),
      ),
      // View the fetched users
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            // Get the current user
            final user = users[index];
            // Initial name, email and image
            // final name = user['name'];
            // final email = user['email'];
            // final image = user['picture'];
            final name = user.name;
            final gender = user.gender;
            final color = user.gender == "male" ? Colors.blue[200] : Colors.pink[100];
            return ListTile(
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(25),
              //     child: Image.network(image['thumbnail'])
              // ),
              // title: Text(name['first']+" "+name['last'],style: TextStyle(fontWeight: FontWeight.bold),),
              // subtitle: Text(email),
              title: Text(user.name.first+" "+user.name.last,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(gender),
              tileColor: color,
            );
      }),
    );
  }

  Future<void> fetchData() async {
    final response = await userApi.fetchData();
    setState(() {
      this.users = response;
    });

  }
}
