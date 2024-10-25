
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/model/homescreenModel.dart';

class Homescreencontroller with ChangeNotifier {

   List<universitymodel>universitylists=[];
   bool isloading=false;
  Future<void> university() async {
    isloading=true;
    notifyListeners();
    final url=Uri.parse("http://universities.hipolabs.com/search?country=United+States");

   

    try{
       final response=await http.get(url);
      if(response.statusCode == 200){
        print(response.body);
      }
      var converted=jsonDecode(response.body);

      universitylists=converted
      .map<universitymodel>((e)=>universitymodel(
        code:e["alpha_two_code"],
        domain: (e["domains"]as List).isNotEmpty?e["domains"][0]
        :"null" ,
        country: e["country"],
        name: e["name"],
        province: e["state-province"],
        webpage:(e["web_pages"] as List).isNotEmpty ? e["web_pages"][0]
        : "null",

      )).toList();
      notifyListeners();
    }catch(e){

      print(e);
    }
      isloading =false;
    notifyListeners();

  }
}