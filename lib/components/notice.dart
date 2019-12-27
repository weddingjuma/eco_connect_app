import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notice extends StatefulWidget {
  final user;
  Notice(this.user);
  @override
  _NoticeState createState() => _NoticeState(this.user);
}

class _NoticeState extends State<Notice> {
  final user;
  _NoticeState(this.user);

  bool show = true;
  bool isWorking = true;
  List notice = List();

  @override
  void initState() {
    fetchNotice();
    super.initState();
  }

  void fetchNotice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var result = await ApiService.getData('api/v1/notifications', token);
    //print(result);
    if (result.containsKey('data')) {
      setState(() {
        notice = result['data'] as List;
        if (notice.length > 0) {
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
        body: Stack(
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
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Notifications',
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
        itemCount: notice.length,
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
                  
                  title: Text(notice[index]['time'] +' '+ notice[index]['message']+' \n '+ notice[index]['author'],
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