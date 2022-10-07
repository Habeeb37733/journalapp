import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/readsingleentrylist.dart';
import 'constants.dart';

class journeytitle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("Journey",
        style: TextStyle(
          fontSize: 64,
          fontFamily: 'Kanit',
          fontWeight: FontWeight.bold,
          foreground: Paint()..style=PaintingStyle.stroke..strokeWidth=10..color=Color(0xff00114f),
        ),),
        Text('Journey',
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kanit',
          color: Colors.white,
        ),)
      ],
    );
  }
}

class journeybutton extends StatelessWidget {
  final String label;
  final fn;

  const journeybutton({Key ? key, required this.label, this.fn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(vertical: 5,
        horizontal: 3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30,)),
          border: Border.all(
            width: 3,
            color: Colors.white,
          ),
        ),
        child: Center(child: Text(label,
        style: kbuttontext,
        )),
      ),
    );
  }
}

class entrytile extends StatelessWidget {
  final title;
  final entry;
  final datetime;
  const entrytile({Key? key, this.title, this.entry, this.datetime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15),
        ),
          boxShadow: [
            BoxShadow(
          color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              offset:Offset (0 , 7),

      )
          ]
      ),
      child: ListTile(

        contentPadding: EdgeInsets.all(3),

        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          readsingleentry(title:title,entry:entry,date:datetime)
          ));
        },

        title: Text(title,style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 28
        ),),
        subtitle:  Text(entry,style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.purple,

          fontSize: 24,
        ),),
        trailing: Column(
          children: [
            Text(
            '${datetime.substring(5, 11)}, ${datetime.substring(0, 3)}',
            style: TextStyle(
              fontSize: 20 ,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 3),
            Text(
              datetime.substring(17).trim(),
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff00114f),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


