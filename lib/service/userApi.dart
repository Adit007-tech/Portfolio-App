import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class userApi{

  static Future<List<User>> fetchData() async{
    print("fetchData Called");
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json =  jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed  = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']
      );
      return User(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name

      );
    }).toList();
    print('Fetch User Complited');
    return transformed;
  }
}