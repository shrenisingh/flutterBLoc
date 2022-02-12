import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  var onPressed;
  final String? buttonName;
   var color;
  


  CustomButton({ Key? key , this.onPressed,this.buttonName,this.color}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width*0.30,
      child: ElevatedButton(onPressed: onPressed,
      
      style: ButtonStyle(
      backgroundColor: color,
    ),
      
      child: Text(buttonName!,
      style: TextStyle(color: Colors.white,
      fontSize: 16),
      
      ),
      ),
      
    );
  }
}