

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../components.dart';
import '../constants.dart';

class addentrysc extends StatefulWidget {
  const addentrysc({Key , key}) : super(key: key);

  @override
  State<addentrysc> createState() => _addentryscState();
}

class _addentryscState extends State<addentrysc> {
  TextEditingController titlecontrol=new TextEditingController();
  TextEditingController entrycontrol=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: kscreenbg,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SizedBox(height: 10,),
            journeytitle(),
            SizedBox(height: 10,),
            Container(
              width: w*02,
              padding: EdgeInsets.symmetric(vertical: 3,
                horizontal: 9,

              ),
              decoration:kdec,
              child: Container(
              child: Center(
                child: TextFormField(
                  controller: titlecontrol,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,

                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter The Title",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.7),
                    )
                  ),
                ),
              ),
              ),

            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              width: w*08,
                padding: EdgeInsets.symmetric(
                  vertical:3,
                  horizontal: 9,
                ),
          child: SingleChildScrollView(
            reverse: entrycontrol.text.length>20?true:false,
            child: TextFormField(
              controller: entrycontrol,
              maxLines: 15,
              cursorColor: Colors.white,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                color: CupertinoColors.opaqueSeparator,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "enter new entry",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.7),
                fontSize: 25,
                fontWeight: FontWeight.bold)
              ),

            ),
          ),
           ),
            ),
            SizedBox(height:20),

    journeybutton(
      label: "SAVE",
      fn: ()async{
        if(titlecontrol.text.isEmpty==null||entrycontrol.text.isEmpty==null)
          print("please enter  details");
        else{
          await FirebaseFirestore.instance.collection('entries').add({
            'Title':titlecontrol.text,
            'Entry':entrycontrol.text,
            'Date':DateFormat.yMMMEd().add_jm().format(DateTime.now()),
          }).then((value) { showFirebasealert(context);
          Navigator.pop(context);
          }).catchError((error)=>
              showErrorAlert(context));
          titlecontrol.clear();
          entrycontrol.clear();
        }
      },
    )
          ],
        ),
      ),
    );
  }

  showFirebasealert(BuildContext context){
    Widget okbutton=TextButton(onPressed: (){Navigator.of(context).pop();}, child:Text( "OK"));
    AlertDialog alert=new AlertDialog(
      title: Text("Data upload and status"),
      content: Text("Entry Added Succesfully"),
      actions: [
        okbutton,
      ],
    );
    showDialog(context: context, builder: (context){
      return alert;
    });
}
  showErrorAlert(BuildContext context){
    Widget okbutton=TextButton(onPressed: (){Navigator.of(context).pop();}, child:Text( "OK"));
    AlertDialog alert=new AlertDialog(
      title: Text("Error Ocuures"),
      content: Text("Entry does not Added Succesfully"),
      actions: [
        okbutton,
      ],
    );
    showDialog(context: context, builder: (context){
      return alert;
    });
  }
  @override
  void dispose() {
    titlecontrol.dispose();
    entrycontrol.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
