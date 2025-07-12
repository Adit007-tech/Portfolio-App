import 'package:moneycontrol/model/user_dob.dart';
import 'package:moneycontrol/model/user_location.dart';
import 'package:moneycontrol/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  // constructor
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
  });

  String get FullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}
