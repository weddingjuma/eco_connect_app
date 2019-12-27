import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  final user;
  History(this.user);
  @override
  _HistoryState createState() => _HistoryState(this.user);
}

class _HistoryState extends State<History> {
  final user;
  _HistoryState(this.user);

  bool show = true;
  bool isWorking = true;
  List trans = List();

  @override
  void initState() {
    fetchHistory();
    super.initState();
  }

  void fetchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var result = await ApiService.getData('api/v1/request/pickup/${user.phone}', token);
    if (result.containsKey('data')) {
      setState(() {
        trans = result['data'] as List;
        if (trans.length > 0) {
          isWorking = false;
        } else {
          show = false;
        }
      });
    } else {
      setState(() {
        isWorking = false;
        show = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Design mStyle = Design(context);
    return Scaffold(
      appBar: PreferredSize(
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
            ],
          )),
      body:Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
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
                        Icons.local_shipping,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Pickup History',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ))),
          ),
            Container(
              padding: EdgeInsets.only(top: 80),
                  child:

                   show  ?  
                   
                   Visibility(
                     visible: isWorking,
                     child:
                      Center(
                        child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                      ),
                      replacement:

      
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shrinkWrap: true,
        itemCount: trans.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.cyan[300],
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_shipping,
                    size: 50,
                    color: Colors.white,
                  ),
                  
                  title: Text(trans[index]['time'] +' Your pickup request for '+ trans[index]['waste']+' waste was submitted. Address : '+ trans[index]['image'] +' and the status is '+ trans[index]['status'],
                    style: TextStyle(
                        color: Colors.white, height: 1.2, letterSpacing: 0.5),
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
          );
          
        },
      ),
      ): Image(
                         height: MediaQuery.of(context).size.height,
                         image: AssetImage('assets/image/noMsg.png'),
                       )
    )
        ],
      ) 
    );
  }
}
