class user_location{
  final location_street Street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  // final String coordinates;
  // final String timezone;

  user_location({
    required this.Street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    // required this.coordinates,
    // required this.timezone
  });
}

class location_street{
  final int number;
  final String name;
  location_street({required this.number,required this.name});
}