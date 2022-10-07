import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/Screens/readentry.dart';

import '../components.dart';
import '../constants.dart';
import 'Addentry.dart';

class homescreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Expanded(
      child: Scaffold(
        body: Container(
          height: h,
          width: w,
          decoration: kscreenbg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              journeytitle(),
              SizedBox(height: 40,),
              Image(image: AssetImage('images/book.png'),
              width:150,
                height:150,
              ),
              SizedBox(height: 40,),
              journeybutton(
                fn: () async{
                  await FirebaseFirestore.instance.collection('entries').get().then((snapshot) {
                   List<QueryDocumentSnapshot>  docs= snapshot.docs;
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>readentry( docs: docs,)));
                  });
                },
                  label: "Read Entries",
              ),
              SizedBox(height: 20,),
              journeybutton(
                fn: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> addentrysc()));
                },
                label: "Add Entries",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
