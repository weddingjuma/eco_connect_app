import 'package:eco_connect_app/model/design.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    Design mStyle = Design(context);
    return Scaffold(
       appBar:
      PreferredSize(
          preferredSize: Size.fromHeight(70.0), // here the desired height
          child: AppBar(
            actions: <Widget>[
          Container(
            color: Colors.white,
            child: ClipPath(
              child: Container(
                height: mStyle.getheigth(val: 200),
                color: Theme.of(context).primaryColor,
                child: Image.asset(
                  'assets/image/eco-connect.png',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: mStyle.getheigth(val: 50),
                  width: mStyle.getwidth(),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
              ),
              
            ),
          ),
        ], )
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: <Widget>[
          
            Card(
              color: Colors.cyan[300],
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5,),
        const ListTile(
          leading: Icon(Icons.notification_important, size: 50, color: Colors.white,),
          title: Text('Wed Sep 25 2019 03:19:10 GMT+0000 (Coordinated Universal Time) Thanks all for signing up to Ecoconnect, we promise it will be a whole new experience for you all, please sign up for a training program that will expose you to all and more of what we are doing and the entire industry of waste recovery and the business of it all please follow this link to register https://bit.ly/MADE_WRA_Training Thanks Osayi Omokaro (admin)', 
          style: TextStyle(color: Colors.white, height: 1.2, letterSpacing: 0.5) ,),
          ),
        SizedBox(height:5)
      ],
    ),
  ),
  Card(
              color: Colors.cyan[300],
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 5,),
        const ListTile(
          leading: Icon(Icons.notification_important, size: 50, color: Colors.white,),
          title: Text('Wed Sep 25 2019 03:19:10 GMT+0000 (Coordinated Universal Time) Thanks all for signing up to Ecoconnect, we promise it will be a whole new experience for you all, please sign up for a training program that will expose you to all and more of what we are doing and the entire industry of waste recovery and the business of it all please follow this link to register https://bit.ly/MADE_WRA_Training Thanks Osayi Omokaro (admin)', 
          style: TextStyle(color: Colors.white, height: 1.2, letterSpacing: 0.5) ,),
          ),
        SizedBox(height:5)
      ],
    ),
  ),
          ],
        ),

      
    );
  }
}