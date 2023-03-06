
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangeFav{

  TextEditingController favController = TextEditingController();

Future favUser() async {
  const url = 'https://api.npoint.io/b6c51f9c6993e1ade68f';

  var response = await http.post(Uri.parse(url),
   body : jsonEncode({
    "favorite": favController.text,
  }));

  if(response.statusCode==200){
    var loginArr = json.decode(response.body);
    if(loginArr == "0"){
        loginArr = "1";
    }else{
       loginArr = "0";
    }
    print(loginArr);
  }else{
    print(response.body);

  }
}

}