


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget tableItem(BuildContext context, IconData icon, String text, Color color){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 100,
      width: (MediaQuery.sizeOf(context).width/2)-16,
      decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey),
      ),
      child:  Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: double.maxFinite,
            width: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            child:Center(
              child: Icon(icon),
            ),
          ),
          Text(text, style: const TextStyle(fontSize: 25,),),
          const Text("")
        ],
      ),
    ),
  );
}


