import 'package:eco_connect_app/classes/custom-clip.dart';
import 'package:eco_connect_app/model/User.dart';
import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/route/index.dart';
import 'package:eco_connect_app/route/login.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:eco_connect_app/services/storage.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _userForm = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState>_scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isWorking = false;

  List<String> _gender = ['Male', 'Female'];
  List<String> _state = ['Edo'];
  List<String> _cities = ['Abudu', 'Afuze', 'Auchi', 'Benin City', 'Ekpoma', 'Ewu', 'Fugar', 'Ibillo', 'Igarra', 'Igueben', 'Irrua', 'Okpella', 'Sabongida-Ora', 'Ubiaja', 'Urhonigbe', 'Uromi', 'Uzebba'];
  
  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value),
    backgroundColor: Colors.red[400]
    ));
}

   _isLoading(){
      setState((){
        _isWorking = true;
      });
    }
    _isNotLoading(){
      setState((){
        _isWorking= false;
      });
    }
  
  String _selectedState;
  String _selectedCity;
  String _selectedGender;
  

  // initalization of user details..
  String _firstname;
  String _lastname;
  String _phone;
  String _email;
  String _usertype;
  String _password;

  String _dropdownGender;
  String _dropdownCity;
  String _dropdownState;

  validateUser() async {
    final userForm = _userForm.currentState;
    if (_selectedGender == null) {
      setState(() => _dropdownGender = "Please select a gender!");
      return false;
    }
    if (_selectedState == null) {
      setState(() => _dropdownState = "Please select a State!");
      return false;
    }
    if (_selectedCity == null) {
      setState(() => _dropdownCity = "Please select a city!");
      return false;
    }
      if (userForm.validate()) {
        _isLoading();
        _userForm.currentState.save();
        if(_email.isEmpty){
          _email = 'null';
        }
        
        final data = {
          'firstname': _firstname,
          'lastname': _lastname,
          'phone' : _phone,
          'email': _email,
          'password': _password,
          'usertype': 'client',
          'gender': _selectedGender,
          'state': _selectedState,
          'city': _selectedCity

        };
        print(data);
        var result = await ApiService.postData(data, 'api/v1/signup');
         if (result.containsKey('data')) {
          Storage.savetoken(result['token'].toString());
          final user = new User.fromJson(result['data']);

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Index(user),
          ));
        } else {
          _isNotLoading();
          showInSnackBar(result['error'].toString());
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
            padding: EdgeInsets.all(20),
            child:Form(
              key: _userForm,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Registration",
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: mStyle.getheigth(val: 2),
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
                    child: Column(children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                              validator: (value) => value.isEmpty ? 
                              'First Name is required': null,
                              onSaved: (value) => _firstname = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                              validator: (value) => value.isEmpty ?
                              'Last Name is required': null,
                              onSaved: (value) => _lastname = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                              validator: (value) => value.isEmpty ? 
                              'Phone number is required': null,
                              onSaved: (value) => _phone = value,
                              keyboardType: TextInputType.phone,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Email Address (optional)',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                              onSaved: (value)=> _email = value,
                        ),
                      ),
                       Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child:DropdownButtonHideUnderline( 
                          child: DropdownButton(
                          isExpanded: true,
                      value:_selectedGender,
                      hint: Text('Please Select Gender',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                             )),
                      style: TextStyle(
                        fontSize: 15,
                          color: Colors.grey),
                      onChanged: (newValue) {
                        
                        setState(() {
                          _selectedGender = newValue;
                          _dropdownGender = null;
                         
                        });
                      },
                      items: _gender.map((gender) {
                        return DropdownMenuItem(
                          child: new Text(
                            gender,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: gender,
                        );
                      }).toList(),
                    ),),
                    ),
                    _dropdownGender == null
              ? SizedBox.shrink()
              : Text(
            _dropdownGender ?? "",
            style: TextStyle(color: Colors.red), textAlign: TextAlign.right,
          ),
                  
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child:DropdownButtonHideUnderline( 
                          child: DropdownButton(
                          isExpanded: true,
                      value:_selectedState,
                      hint: Text('Please Select State',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                             )),
                      style: TextStyle(
                        fontSize: 15,
                          color: Colors.grey),
                      onChanged: (newValue) {
                        
                        setState(() {
                          _selectedState = newValue;
                          _dropdownState = null;
                         
                        });
                      },
                      items: _state.map((state) {
                        return DropdownMenuItem(
                          child: new Text(
                            state,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: state,
                        );
                      }).toList(),
                    ),),
                    ),
                    _dropdownState == null
              ? SizedBox.shrink()
              : Text(
            _dropdownState ?? "",
            style: TextStyle(color: Colors.red), textAlign: TextAlign.right,
          ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child:DropdownButtonHideUnderline( 
                          child: DropdownButton(
                          isExpanded: true,
                      value:_selectedCity,
                      hint: Text('Please Select City',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                             )),
                      style: TextStyle(
                        fontSize: 15,
                          color: Colors.grey),
                      onChanged: (newValue) {
                        
                        setState(() {
                          _selectedCity = newValue;
                          _dropdownCity = null;
                         
                        });
                      },
                      items: _cities.map((city) {
                        return DropdownMenuItem(
                          child: new Text(
                            city,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: city,
                        );
                      }).toList(),
                    ),),
                    ),
                    _dropdownCity == null
              ? SizedBox.shrink()
              : Text(
            _dropdownCity ?? "",
            style: TextStyle(color: Colors.red), textAlign: TextAlign.right,
          ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                              validator: (value) => value.isEmpty? 
                              'Password is required': null,
                              onSaved: (value) => _password = value,
                        ),
                      ),
                    ])),
                SizedBox(
                  height: mStyle.getheigth(val: 5),
                ),

                Container(
                              child: Visibility(
                                visible:_isWorking,
                                child: Container(
                                  //padding: EdgeInsets.only(top: 20.0, left: 80.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),),
          
                                replacement: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      validateUser();
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height:50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(25.0)),
                                        child: Container(
                      height: mStyle.getheigth(val: 8),
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).primaryColor
                      ),
                      
                        child:  Center(
                        child: 
                        Text('Register', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                      ),
                      ),
                                  ),
                                )),
                              ),
                            ),


                SizedBox(
                  height: mStyle.getheigth(val: 5),
                ),
                GestureDetector(
                  onTap: () =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Login(),
          )),
                  child: Center(
                    child: Text('Login Instead?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                )
                
              ],
            ),
              )
            
             
          )
        ],
      ),
    ));
  }
}
