import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/pages/list_provider.dart';
import 'package:moneycontrol/pages/provider.dart';
import 'package:provider/provider.dart';

class first extends StatefulWidget{
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return Consumer<list_provider>(
      builder:(context,numberProver,child) =>  Scaffold(
      appBar: AppBar(
        title: Text('state'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        numberProver.add();
      },child: Icon(Icons.add),
      ),
      body: SizedBox(
          child: Column(
            children: [
              Center(child: Text(numberProver.numbers.last.toString(),style: TextStyle(fontSize: 40),)),
              Expanded(
                child: ListView.builder(itemCount: numberProver.numbers.length,
                    itemBuilder: (context, index){
                  return Text(numberProver.numbers[index].toString(),style: TextStyle(fontSize: 40),);
                }),
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => provider_screen()));
              }, child: Text("Prover Screen"))
            ],
          )
        ),
      ),
    );
  }
}