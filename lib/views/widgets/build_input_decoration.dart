import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(IconData icons,String hinttext) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
    hintText: hinttext,
    prefixIcon: Icon(icons,color: Color(0xFDC2BBBB),),
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
          color: Colors.blueGrey,
          width: 2.0
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        
        color:Colors.grey,
        width: 2.0,
      ),
    ),
    enabledBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
      
        color:Colors.grey,
      
        width: 2.0,
      ),
    ),
  );
}