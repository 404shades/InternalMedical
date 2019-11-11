import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medibuddy/Design/gradients.dart';
import 'dart:ui' as ui;
class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class Gems{
  final String gemAsset;
  final LinearGradient linearGradient;

  Gems({this.gemAsset, this.linearGradient});
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Available ID Cards",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w700),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: UserIDCards(),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Need a new ID Card ?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),
                    SizedBox(height: 20,),
                    Text("Request a new ID card and we'll mail you one"),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        gradient: mediBuddyGradient,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(
                        child: Text("Request ID Cards"),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: ()=>null,
                      ),
                    ),
                     SizedBox(height: 20,),
                    Text("Need temporary evidence of coverage ?",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w700),),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        gradient: mediBuddyGradient,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: MaterialButton(
                        child: Text("View Coverage Evidences"),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: ()=>null,
                      ),
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

class UserIDCards extends StatefulWidget {
  @override
  _UserIDCardsState createState() => _UserIDCardsState();
}

class _UserIDCardsState extends State<UserIDCards> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      enlargeCenterPage: true,
      height: 200,
      items: [Gems(gemAsset: "assets/images/blue.png",linearGradient: mediBuddyGradient),Gems(gemAsset: "assets/images/green.png",linearGradient: greenSexyGradient),Gems(gemAsset: "assets/images/red.png",linearGradient: redSexyGradient)].map((index){
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
          ),
         child: Stack(
           children: <Widget>[
             Container(
               alignment: Alignment.centerRight,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20)
               ),
               child: Container(
                 margin: const EdgeInsets.only(right: 10),
                 width: 100,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(index.gemAsset,),
                     fit: BoxFit.fill
                   )
                 ),
               ),
             ),
             new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 0.0,sigmaY: 0.0),
            child: Opacity(
              opacity: 0.8,
                          child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: index.linearGradient
                ),

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Jane Williams",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                Spacer(flex: 1,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Date of Issue : "
                      ),
                      TextSpan(
                        text: "23 November 2019",
                        style: TextStyle(fontWeight: FontWeight.w500)
                      )
                    ]
                  ),
                ),
                Spacer(flex: 2,),
                Text("CORAL MEMBER",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                Spacer(flex: 1,),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text("Self"),
            ),
          )
             ],
         ),
         
        );
      }).toList(),
      
    );
  }
}