import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Waste extends StatefulWidget {
  final user;
  Waste(this.user);
  @override
  _WasteState createState() => _WasteState(this.user);
}

class _WasteState extends State<Waste> {
  final user;
  _WasteState(this.user);
  final _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List _waste = [
    'PET Plastic Bottles',
    'Used Beverage Can (Aluminium)',
    'Paper Waste',
    'Plastic Tables and Chair'
  ];
  String _selectedWaste;
  String _dropdownWaste;
  bool _isWorking = false;
  String msg = '';

  String _address;

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

  validateReq() async {
    final formKey = _formKey.currentState;
    if (_selectedWaste == null) {
      setState(() => _dropdownWaste = "Please select waste type!");
      return false;
    }

    if (formKey.validate()) {
      _isLoading();
      _formKey.currentState.save();

      final data = {'waste': _selectedWaste, 'address': 'null', 'image': _address};
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      print(data);

      var result = await ApiService.postDataWithToken(
          data, 'api/v1/request/pickup', token);
         
      if (result.containsKey('data')) {
        _isNotLoading();
        setState(() {
          msg = result['response'].toString();
        });
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
    Design mStyle = Design(context);
    return new Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0), // here the desired height
            child: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: new Icon(Icons.arrow_back,
                          size: 30, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
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
                            width: mStyle.getwidth(val: 80),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ))),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: <Widget>[
            Container(
                height: mStyle.getheigth(val: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColorLight,
                          blurRadius: 5,
                          offset: Offset(5, 10))
                    ]),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Request Pickup',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ))),
            SizedBox(
              height: 50,
            ),
            Container(
                height: mStyle.getheigth(val: 50),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColorLight,
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
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            value: _selectedWaste,
                            hint: Text('Please Select Waste Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                )),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedWaste = newValue;
                                _dropdownWaste = null;
                              });
                            },
                            items: _waste.map((waste) {
                              return DropdownMenuItem(
                                child: new Text(
                                  waste,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                value: waste,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      _dropdownWaste == null
                          ? SizedBox.shrink()
                          : Text(
                              _dropdownWaste ?? "",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.right,
                            ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Enter Address',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                          validator: (value) =>
                              value.isEmpty ? 'Address can\'t be empty' : null,
                          onSaved: (value) => _address = value,
                          keyboardType: TextInputType.text,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Visibility(
                          visible: _isWorking,
                          child: Container(
                            //padding: EdgeInsets.only(top: 20.0, left: 80.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          replacement: Container(
                              child: GestureDetector(
                            onTap: () {
                              validateReq();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Container(
                                height: mStyle.getheigth(val: 8),
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).primaryColor),
                                child: Center(
                                  child: Text(
                                    'Request Pickup',
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(msg, style: TextStyle(fontSize: 15, color: Colors.red))
                    ]))),
          ],
        ));
  }
}
