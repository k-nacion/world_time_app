import 'package:flutter/material.dart';
import 'package:world_time_app/layout/widgets/WorldTimeHomeScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var worldTimeData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('World Time'),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorldTimeHomeScreen(worldTime: worldTimeData,),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/chooseLocation');
                },
                icon: Icon(Icons.api),
                label: Text('Choose location'))
          ],
        ),
      ),
    );
  }
}
