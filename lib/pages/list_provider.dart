import 'package:flutter/cupertino.dart';

class list_provider extends ChangeNotifier{

  List<int> numbers = [1,2,3,4,5];

  void add(){
     int last = numbers.last;
     numbers.add(last + 1);
     notifyListeners();
  }

}