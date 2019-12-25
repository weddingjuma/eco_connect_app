import 'package:eco_connect_app/classes/custom-clip.dart';
import 'package:eco_connect_app/model/design.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  List<String> _gender = ['Male', 'Female'];
  List<String> _state = ['Edo'];
  List<String> _cities = ['Abudu', 'Afuze', 'Auchi', 'Benin City', 'Ekpoma', 'Ewu', 'Fugar', 'Ibillo', 'Igarra', 'Igueben', 'Irrua', 'Okpella', 'Sabongida-Ora', 'Ubiaja', 'Urhonigbe', 'Uromi', 'Uzebba'];
  String _selectedState;
  String _selectedCity;
  String _selectedGender;
  @override
  Widget build(BuildContext context) {
    
    Design mStyle = new Design(context);
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "Create Account",
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
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Email Address (optional)',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
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
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                    ])),
                SizedBox(
                  height: mStyle.getheigth(val: 5),
                ),
                Container(
                  height: mStyle.getheigth(val: 8),
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: mStyle.getheigth(val: 5),
                ),
                Center(
                    child: Text('Login Instead?',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
