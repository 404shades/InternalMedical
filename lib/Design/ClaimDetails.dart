import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ClaimDetails extends StatefulWidget {
  @override
  _ClaimDetailsState createState() => _ClaimDetailsState();
}

class _ClaimDetailsState extends State<ClaimDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CustomAppBar(),
                  UserData()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text("Claim Details",style: TextStyle(color: const Color(0xFF495aff),fontSize: 22,fontWeight: FontWeight.w800),),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.all(12),
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Compensation",style: TextStyle(color: const Color(0xFF495aff)),)),
                    DataColumn(label: Text("Amount",style: TextStyle(color: const Color(0xFF495aff)),)),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Text("Claim Amount")
                        ),
                        DataCell(
                          Text("\$100")
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("Total Expende")
                        ),
                        DataCell(
                          Text("\$124")
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("Coverage Amount")
                        ),
                        DataCell(
                          Text("\$85")
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("Deductible")
                        ),
                        DataCell(
                          Text("\$24")
                        )
                      ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("Incident Date")
                        ),
                        DataCell(
                          Text("23 November 2019")
                        )
                      ]
                    ),
                    
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      decoration: BoxDecoration(
        color: const Color(0xFF495aff)
      ),
    );
  }
}


class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
    int _current = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            
            title: Text("Claim Details"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 6),
            child: Text(
              "Claim Details for Vedanta",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:32.0,top: 10,bottom: 10),
            child: Text("Here's claim report detail",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w200,color: Colors.white),),
          ),
          AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 400),
            child: ClaimCard()
          )
         
        ],
      ),
    );
  }
}

class ClaimCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "Your Claim",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: const Color(0xFF495aff),
                          shape: BoxShape.circle),
                      child: Icon(
                        Feather.getIconData('activity'),
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "Date of incident : 03 November 2019",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  RichText(
                                
                                text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(text: "Your claim is in : "),
                                    TextSpan(text: "REVIEW",style: TextStyle(color: const Color(0xFFE86542)))
                                  ]
                                ),
                              ),
                              SizedBox(height: 20,),
                              LinearPercentIndicator(
                                backgroundColor: const Color(0xFFF3F3F3),
                                progressColor: const Color(0xFFE86542),
                                animation: true,
                                percent: Random().nextDouble()
                              ),
                              SizedBox(height: 10,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("CLAIMED"),
                            Text(
                              "1000 \$",
                              style: TextStyle(
                                  color: const Color(0xFF495aff),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 21),
                            )
                          ],
                        ),
                        new Container(
                          height: 30.0,
                          width: 1.0,
                          color: Colors.black38,
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("TOTAL"),
                            Text(
                              "1875 \$",
                              style: TextStyle(
                                  color: const Color(0xFF495aff),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 21),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Text("Claim for Vedanta Hospital, Bangalore, India",style: TextStyle(fontSize: 14,color: Colors.black45),)
                ],
              ),
            ),
          );
  }
}



