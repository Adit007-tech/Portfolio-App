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
    required this.name
  });
}
class UserName {
  final String title;
  final String first;
  final String last;
  // constructor
  UserName({
    required this.title,
    required this.first,
    required this.last
  });


}