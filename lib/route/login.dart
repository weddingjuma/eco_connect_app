import 'package:eco_connect_app/classes/custom-clip.dart';
import 'package:eco_connect_app/model/User.dart';
import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/route/index.dart';
import 'package:eco_connect_app/route/signup.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:eco_connect_app/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String _phone;
  String _password;
  bool _isWorking = false;
  String token = '';

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value), backgroundColor: Colors.red[400]));
  }

  _isLoading() {
    setState(() {
      _isWorking = true;
    });
  }

  _isNotLoading() {
    setState(() {
      _isWorking = false;
    });
  }

  validate() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      _isLoading();
      _formKey.currentState.save();
      try {
        var result = await ApiService.postData(
            {'phone': _phone, 'password': _password}, 'api/v1/login');
        if (result.containsKey('token')) {
          Storage.savetoken(result['token'].toString());
          final user = new User.fromJson(result['data']);

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Index(user),
          ));
          _isNotLoading();
        } else {
          _isNotLoading();
          showInSnackBar(result['error'].toString());
        }
      } catch (e) {
        _isNotLoading();
        showInSnackBar('Service not available, please try again later');
      }
    } else {
      print('form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    Design mStyle = new Design(context);
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
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
                      "Welcome",
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
                                  offset: Offset(5, 10))
                            ]),
                        child: Form(
                            key: _formKey,
                            child: Column(children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value) => value.isEmpty
                                      ? 'Phone number can\'t be empty'
                                      : null,
                                  onSaved: (value) => _phone = value,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                  validator: (value) => value.isEmpty
                                      ? 'Password can\'t be empty'
                                      : null,
                                  onSaved: (value) => _password = value,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ]))),
                    SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                    Container(
                      child: Visibility(
                        visible: _isWorking,
                        child: Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                        replacement: Container(
                          child: Padding(
                              padding: EdgeInsets.only(
                                top: 20.0,
                                left: 25.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  validate();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  child: Container(
                                    height: mStyle.getheigth(val: 8),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context).primaryColor),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mStyle.getheigth(val: 5),
                    ),
                    Center(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text('Create an Account?',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
