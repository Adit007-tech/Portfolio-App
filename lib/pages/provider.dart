import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneycontrol/pages/list_provider.dart';
import 'package:provider/provider.dart';

class provider_screen extends StatefulWidget{

  const provider_screen({super.key});
  @override
  State<provider_screen> createState() => _provider_screenState();
}

class _provider_screenState extends State<provider_screen> {
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
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return Text(numberProver.numbers[index].toString(),style: TextStyle(fontSize: 40),);
                      }),
                ),
              ],
            )
        ),
      ),
    );
  }
}