import 'package:flutter/material.dart';
import 'package:world_time_app/model/location.dart';
import 'package:world_time_app/model/worldtime.dart';
import 'package:world_time_app/services/networkHelper.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool isLoading = true;

  void createNetworkRequest() async {
    WorldTime worldTime =
        WorldTime(Location(continent: 'asia', city: 'manila'));

    await worldTime.getTime(worldTime);

    print(worldTime.location);
    print(worldTime.timezone);
    print(worldTime.abbreviation);
    print(worldTime.datetime);
    print(worldTime.unixtime);

    setState(() {
      isLoading = false;
      Navigator.pushReplacementNamed(context, '/home', arguments: worldTime);
    });
  }

  @override
  void initState() {
    super.initState();
    createNetworkRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF84A98C),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Center(
          child: Loading(context),
        ),
      ),
    );
  }

  Column Loading(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator.adaptive(
          backgroundColor: Color(0xFFCAD2C5),
          strokeWidth: 2,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Loading...',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F3E46)),
        ),
      ],
    );
  }
}
