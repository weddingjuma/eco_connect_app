import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
String baseUrl = 'https://ecoconnect.herokuapp.com';
class ApiService {
  // login
  static Future<Map> postData(Map data, url) async{
    try{
    http.Response response = await http.post('${baseUrl}/${url}', body: data);
    Map jsonData = json.decode(response.body);
    print(jsonData);
    return jsonData;
    } catch (e){
      print(e);
      //return false;
    }

  }
  static Future<Map> postDataWithToken(Map data, url, token) async{
    try{
    http.Response response = await http.post('${baseUrl}/${url}', body: data, headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}' });
    Map jsonData = json.decode(response.body);
    return jsonData;
    } catch (e){
      print(e);
      //return false;
    }
  }
  static Future<dynamic> getData(url, token) async{
    try{

      http.Response response = await http.get('${baseUrl}/${url}', headers: {HttpHeaders.authorizationHeader: 'Bearer ${token}' });
      
      return  json.decode(response.body);
       
    } catch (e){
      print(e);
    }
  }
}