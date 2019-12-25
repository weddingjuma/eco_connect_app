import 'package:eco_connect_app/classes/custom-clip.dart';
import 'package:eco_connect_app/model/design.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    Design mStyle = new Design(context);
    return Scaffold(
      body:Container(
      
      color: Theme.of(context).primaryColor,
          height: mStyle.getheigth(),
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ClipPath(
                  child: Container(
                    height: mStyle.getheigth(val: 30),
                    color: Theme.of(context).primaryColor,
                    child: Image.asset(
                      'assets/image/eco-connect.png',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      height: mStyle.getheigth(val: 30),
                      width: mStyle.getwidth(),
                    ),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                  ),
                  clipper: CustomClip(),
                ),
              ),
              Container(
                color: Colors.white,
                height: mStyle.getheigth(val: 70),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 5,
                            offset: Offset(5, 10)
                          )
                        ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey[200]))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                        ])
                  ),
                  SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                  Container(
                      height: mStyle.getheigth(val: 8),
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor
                      ),
                      
                        child:  Center(
                        child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      ),


                   SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                     Center(child: Text('Create an Account', style:TextStyle(color: Colors.grey[600], fontSize: 17, fontWeight: FontWeight.bold))),
                   
                    
                  ],
                ),
              )
            ],
          ),
    )
    ); 
    
    
     
  }
}