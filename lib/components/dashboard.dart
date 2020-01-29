import 'package:eco_connect_app/components/history.dart';
import 'package:eco_connect_app/components/waste.dart';
import 'package:eco_connect_app/model/design.dart';
import 'package:eco_connect_app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatefulWidget
{
  final user;
  Dashboard(this.user);
  @override
  State<StatefulWidget> createState() => _DashboardState(this.user);
}

class _DashboardState extends State<Dashboard>
{
  final user;
  _DashboardState(this.user);
  String pending = '0';
  request() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
    
    var result = await ApiService.getData('api/v1/request/pickup/${user.phone}', token);
      List<dynamic> status = result['data'];
      var count = status.where((pending) => pending['status'] == 'Pending');
     setState(() {
       pending =  count.length.toString();
     });
      
    }
  

  
  @override
  void initState() {
    request();
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    Design mStyle = Design(context);
    return Scaffold
    (
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
              //clipper: CustomClip(),
            ),
          ),
        ], )
        ),
      
        
        
     
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          Container(
            child: Text('Customer ID: '+user.phone, style: TextStyle(), textAlign: TextAlign.right,) ,
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Waste Recycled', style: TextStyle(color: Colors.grey[700])),
                      Text('0', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0))
                    ],
                  ),
                  Material
                  (
                    color: Colors.yellow[800],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                    (
                      child: Padding
                      (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.delete, color: Colors.white, size: 30.0),
                      )
                    )
                  )
                ]
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Waste(user))),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Earnings', style: TextStyle(color: Colors.grey[700])),
                      Text('₦0', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                  (
                    color: Colors.green[600],
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                    (
                      child: Padding
                      (
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.confirmation_number, color: Colors.white, size: 30.0),
                      )
                    )
                  )
                ]
              ),
            ),
          ),
         
         
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Pending Pickup Requests', style: TextStyle(color: Colors.grey[700])),
                      Text(pending, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  ),
                  Material
                  (
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                    (
                      child: Padding
                      (
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.local_shipping, color: Colors.white, size: 30.0),
                      )
                    )
                  )
                ]
              ),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => History(user))),
          ),
           _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Our Store', style: TextStyle(color: Colors.grey[700])),
                      Container()
                    ],
                  ),
                  Material
                  (
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center
                    (
                      child: Padding
                      (
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.store, color: Colors.white, size: 30.0),
                      )
                    )
                  )
                ]
              ),
            ),
            //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
          )
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 20.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
        ],
      )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell
      (
        // Do onTap() if it isn't null, otherwise do print()
        onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
        child: child
      )
    );
  }
}