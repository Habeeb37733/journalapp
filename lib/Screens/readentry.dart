import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/Screens/homescreen.dart';

import '../components.dart';
import '../constants.dart';
import 'Addentry.dart';

class readentry extends StatefulWidget {
 final List<QueryDocumentSnapshot> docs;
  const readentry({Key? key, required this.docs}) : super(key: key);

  @override
  State<readentry> createState() => _readentryState();
}

class _readentryState extends State<readentry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kscreenbg,
        child:widget.docs.isEmpty ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            journeytitle(),
           SizedBox(height: 20,),
           Expanded(child:
           Text("Please Add Entry",style: kbuttontext,
           )),
            SizedBox(height: 20,),
            journeybutton(
              fn: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> addentrysc()));
              },
              label: "Add Entries",
            ),

SizedBox(height: 30,)
          ],
        )
            :
        Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            journeytitle(),
            SizedBox(height: 20,),
            Expanded(child:
            ListView.separated(
                itemBuilder: (context,index){
                return  entrytile(
                title: widget.docs.elementAt(index)['Title'],
                entry: widget.docs.elementAt(index)['Entry'],
                datetime: widget.docs.elementAt(index)['Date'],
              );
            },

                separatorBuilder: (context,index){
                  return SizedBox(
                    height: 10,
                  );
                }, itemCount: widget.docs.length)),
            journeybutton(label: 'Back',fn: (){
              Navigator.pop(context);
            },),
            SizedBox(height: 20,),
          ],

        ),
      ),
    );
  }
}
