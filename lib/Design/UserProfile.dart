import 'package:flutter/material.dart';
import 'package:medibuddy/Design/gradients.dart';

class UserProfileSection extends StatefulWidget {
  @override
  _UserProfileSectionState createState() => _UserProfileSectionState();
}

class _UserProfileSectionState extends State<UserProfileSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),

      ),
  body: SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return GemCard();
            },
          ),
        )
      ],
    ),
  ),
    );
  }
}

class GemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-60,
      
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dback.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight
        ),
        borderRadius: BorderRadius.circular(20)        
      ),
      child: Opacity(
        opacity: 0.5,
              child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: mediBuddyGradient
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text("Rohan Malik",style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w700),)
        ],
      ),
        ),
      )
    );
  }
}