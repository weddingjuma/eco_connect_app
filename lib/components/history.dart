import 'package:eco_connect_app/model/design.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          leading: Icon(Icons.local_shipping, size: 50, color: Colors.white,),
          title: Text('Wed Dec 25 2019 09:32:15 GMT+0000 (Coordinated Universal Time) Your pickup request for pet waste was submitted. Address : images and the status is Pending', 
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