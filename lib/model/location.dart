class Location {

  String continent;
  String city;

  Location({this.continent, this.city});

  @override
  String toString() {
    return 'Location{continent: $continent, city: $city}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          continent == other.continent &&
          city == other.city;

  @override
  int get hashCode => continent.hashCode ^ city.hashCode;
}
