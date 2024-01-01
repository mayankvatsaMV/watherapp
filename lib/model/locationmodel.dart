import 'dart:ffi';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class locationmodel{
  List<String>? loc;
  locationmodel({this.loc});
  factory locationmodel.fromJson(Map<String,dynamic>json){
   return locationmodel(
    loc: (json["location"] as List<String>).map((e){
      return e;
    }).toList(),
   );
}
}
