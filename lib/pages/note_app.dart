import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class note_app extends StatefulWidget{

  @override
  State<note_app> createState() => _note_appState();
}

class _note_appState extends State<note_app> {

  final _noteStream = Supabase.instance.client.from('notes').stream(primaryKey: ['id']);

  final textController = TextEditingController();

  // Stream _noteStream = Supabase.instance.client.from('notes').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NoteApp"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: StreamBuilder(
          stream: _noteStream,
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator()
              );
            }
            // loaded
            final notes = snapshot.data!;

            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                // get individual note
                final note = notes[index];

                // get column you want
                final body = note['body'];
                return Center(
                  child: Column(
                    children: [
                      Text(body,style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                );
              }
            );
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        addnote();
      },child: Icon(Icons.add),
      ),
    );
  }

  void addnote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Add Note"),
          content: TextFormField(
            controller: textController,
          ),
          actions: [
            TextButton(onPressed: (){
              saveNote();
            }, child: Text("Save")),

          ],
        )
    );
  }

  void saveNote() async{
    await Supabase.instance.client.from('notes').insert({
      'body' : textController.text
    });
  }
}