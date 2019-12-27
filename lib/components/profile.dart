import 'package:eco_connect_app/model/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  final user;
  Profile(this.user);
  @override
  ProfileState createState() => ProfileState(this.user);
}

class ProfileState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final user;
  ProfileState(this.user);
  List<String> _state = ['Edo'];
  List<String> _cities = ['Abudu', 'Afuze', 'Auchi', 'Benin City', 'Ekpoma', 'Ewu', 'Fugar', 'Ibillo', 'Igarra', 'Igueben', 'Irrua', 'Okpella', 'Sabongida-Ora', 'Ubiaja', 'Urhonigbe', 'Uromi', 'Uzebba'];
  

  String _selectedState;
  String _selectedCity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Design mStyle = Design(context);
    return new Scaffold(
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
        body: new Container(
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 150.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'assets/image/avatar.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        // Padding(
                        //     padding: EdgeInsets.only(top: 90.0, right: 100.0),
                        //     child: new Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: <Widget>[
                        //         new CircleAvatar(
                        //           backgroundColor: Colors.red,
                        //           radius: 25.0,
                        //           child: new Icon(
                        //             Icons.camera_alt,
                        //             color: Colors.white,
                        //           ),
                        //         )
                        //       ],
                        //     )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 20),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  // new Text(
                                  //   'Personal Information',
                                  //   style: TextStyle(
                                  //       fontSize: 18.0, color: Colors.grey[900],
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                 // _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  
                                  new Text(
                                    'First Name',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextFormField(
                                  initialValue: user.firstname,
                                  decoration: const InputDecoration(
                                    hintText: "Enter First Name",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,

                                ),
                              ),
                            ],
                          )),
                           Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Last Name',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextFormField(
                                  initialValue: user.lastname,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Last Name"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                          Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Phone Number',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextFormField(
                                  initialValue: user.phone,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Phone Number"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Email Address',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextFormField(
                                  initialValue: user.email,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Email Address"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                     
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'City',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'State',
                                    style: TextStyle(
                                        fontSize: 16.0, color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: DropdownButtonHideUnderline( 
                          child: DropdownButton(
                          isExpanded: true,
                      value:_selectedCity,
                      hint: Text(user.city,
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
                                flex: 2,
                              ),
                              Flexible(
                                child: DropdownButtonHideUnderline( 
                          child: DropdownButton(
                          isExpanded: true,
                      value:_selectedState,
                      hint: Text(user.state,
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
                                flex: 2,
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}