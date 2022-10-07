import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components.dart';
import '../constants.dart';

class readsingleentry extends StatelessWidget {
  final title;
  final entry;
  final date;
  const readsingleentry({Key? key, this.title, this.entry, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kscreenbg ,
        child: Column(
          children: [
            SizedBox(height: 10,),
            journeytitle(),
            SizedBox(height: 10,),
            Expanded(
                child:
                Container
                  (
                padding:
                  EdgeInsets.only(
                    top: 12,
                    bottom: 5,
                    left: 10,
                    right: 10,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2.5,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${date.substring(5,17).trim()}\n ${date.substring(0,5).trim()}${date.substring(17).trim()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(title,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),

                          )
                        ],
                      ),
                      Divider(
                        thickness: 5,
                          color: Colors.white,
                        height: 20,
                        endIndent: 20,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(entry,
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),),


                        ],
                      ),

                    ],
                  ),
            ),

            ),
            SizedBox(height: 20,),
            journeybutton(label: 'Back',fn: (){
              Navigator.pop(context);
            },
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
