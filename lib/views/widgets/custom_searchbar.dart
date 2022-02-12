import 'package:flutter/material.dart';
import 'package:go_india_stocks/views/widgets/build_input_decoration.dart';
class CustomSearchBar extends StatelessWidget {
  var onPressed;
 
  


  CustomSearchBar({ Key? key , this.onPressed}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  Container(
                  margin:const EdgeInsets.fromLTRB(8,7,8,8),
                  child: TextField(
                    onTap:onPressed,
                    readOnly: true,
                    textAlign: TextAlign.left,
                    decoration: buildInputDecoration(Icons.search,"Search Client Name",
                      ),
                  ),
                );
  }
}