import 'dart:convert';

import 'package:http/http.dart';
import 'package:world_time_app/model/location.dart';

class WorldTime {
  String abbreviation;
  String datetime;
  String timezone;
  int unixtime;

  Location location;

  WorldTime(this.location, {this.abbreviation, this.datetime, this.timezone, this.unixtime});

  void fromJSON(Map<String, dynamic> responseBody) {
    this.unixtime = responseBody['unixtime'];
    this.datetime = responseBody['datetime'];
    this.abbreviation = responseBody['abbreviation'];
    this.timezone = responseBody['timezone'];
  }


  Future<WorldTime> getTime(WorldTime worldTime) async {
    Response response = await get(Uri.parse(
        'https://worldtimeapi.org/api/timezone/${worldTime.location.continent}/${worldTime.location.city}'));

    if (response.statusCode == 200) {
      Map responseBody = jsonDecode(response.body);
      worldTime.fromJSON(responseBody);
      return worldTime;
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return 'WorldTime{abbreviation: $abbreviation, datetime: $datetime, timezone: $timezone, unixtime: $unixtime}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorldTime &&
          runtimeType == other.runtimeType &&
          abbreviation == other.abbreviation &&
          datetime == other.datetime &&
          timezone == other.timezone &&
          unixtime == other.unixtime &&
          location == other.location;

  @override
  int get hashCode =>
      abbreviation.hashCode ^
      datetime.hashCode ^
      timezone.hashCode ^
      unixtime.hashCode ^
      location.hashCode;
}
