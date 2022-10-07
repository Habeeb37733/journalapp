import 'package:flutter/material.dart';
const kscreenbg=BoxDecoration(
  gradient: LinearGradient(colors: [
    Color(0xffE55D87),
    Color(0xff5FC3E4),
    Color(0xff3CA55C),
  ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
  ),
);
const kdec=BoxDecoration(
  color: Colors.deepPurpleAccent,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);
const kbuttontext =TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: Colors.white,
);