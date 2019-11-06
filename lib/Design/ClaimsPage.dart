import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medibuddy/Design/ClaimDetails.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ClaimsPage extends StatefulWidget {
  @override
  _ClaimsPageState createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage> {
  double claimProgress;
  @override
  void initState() {
    // TODO: implement initState
    claimProgress = Random().nextDouble();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Claims"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("My Claims",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
                  return Stack(
                    alignment: Alignment.topRight,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>ClaimDetails()
                            )),
                                                  child: Container(
                              padding: const EdgeInsets.all(10),
                             
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12.withOpacity(0.07),
                                    spreadRadius: 1,
                                    blurRadius: 5
                                  )
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ListTile(
                                    leading:Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: const Color(0xFF495aff)),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Feather.getIconData('activity'),
                                  color: const Color(0xFF495aff)
                                ),
                              ),
                              title: Text("Vedanta Hospital",style: TextStyle(fontWeight: FontWeight.w500),),
                              subtitle: Text("Date of registration 10 Nov 2019",style: TextStyle(fontSize: 13),),
                                  ),
                                  RichText(
                                    
                                    text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(text: "Your claim is in : "),
                                        TextSpan(text: "Settled by service",style: TextStyle(color: const Color(0xFF39C73D)))
                                      ]
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  LinearPercentIndicator(
                                    backgroundColor: const Color(0xFFF3F3F3),
                                    progressColor: const Color(0xFF39C73D),
                                    animation: true,
                                    percent: Random().nextDouble()
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        decoration: BoxDecoration(
                          color: index%3==2?const Color(0xFFE86542): const Color(0xFF39C73D),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6)
                          )

                        ),
                        child: Text(index%3==2?"REJECTED":"SETTLED",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}