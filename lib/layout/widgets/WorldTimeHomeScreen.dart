import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_time_app/model/worldtime.dart';

class WorldTimeHomeScreen extends StatelessWidget {
  final WorldTime worldTime;

  WorldTimeHomeScreen({this.worldTime});

  String formatDate(WorldTime worldTime) {
    /*DateFormat format = DateFormat('dd MMM yyyy');

    DateTime dateTime = DateTime.parse(worldTime.datetime);

    var date = format.format(dateTime);
*/
    var date = DateFormat.yMMMMd('en_US').add_jm().format(DateTime.parse(worldTime.datetime));
    return date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(worldTime.timezone),
        Text(formatDate(worldTime)),
      ],
    );
  }
}
