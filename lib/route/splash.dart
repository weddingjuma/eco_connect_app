import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/route/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> { 
  @override
  Widget build(BuildContext context) {
    Design mStyle = new Design(context);
    return Container(
          color: Theme.of(context).primaryColor,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              Container(
                height: mStyle.getheigth(val: 60),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/lunch/icon.png',
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "...Exchange your waste for cash!",
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12, color: Colors.white, decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: mStyle.getheigth(val: 50),
                child: Column(
                  children: <Widget>[
                    RaisedButton.icon(
                      onPressed: () {
                        
                      },
                      shape: StadiumBorder(),
                      icon: Icon(Icons.account_circle),
                      label: Text(
                        'SignIn',
                      ),
                      color: Theme.of(context).indicatorColor,
                      textColor: Colors.white,
                    ),
//                  
                  ],
                ),
              )
            ],
          ),
    );
  }
}