import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medibuddy/Design/ArcClipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
         Container(
           
           height: MediaQuery.of(context).size.height/1.5,
           width: MediaQuery.of(context).size.width,
           child: ClipPath(
             clipper: ArcCliper(),
             child: Container(
               padding: const EdgeInsets.only(left: 20,right: 20),
               decoration: BoxDecoration(color: const Color(0xFF495aff)),
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Column(
                     mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Text("Login",style: TextStyle(
                     color: Colors.white,
                    fontSize: 26,
                    
                    fontWeight: FontWeight.w500,
                    
                   ),),
                   SizedBox(height: 10,),
                   Container(
                     width: 50,
                     height: 2,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20)
                     ),
                   )
                     ],
                   ),
                   SizedBox(height: 10,),
                   TextFormField(
                     cursorColor: Colors.white,
                     style: TextStyle(color: Colors.white),
                     decoration: InputDecoration(
                       labelText: "Email",
                       labelStyle: TextStyle(color: Colors.white),
                       enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                       ),
                       
                       focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                       )
                     ),
                   ),
                   SizedBox(height: 10,),
                   TextFormField(
                     cursorColor: Colors.white,
                     style: TextStyle(color: Colors.white),
                     obscureText: true,
                     decoration: InputDecoration(
                       labelText: "Password",
                       labelStyle: TextStyle(color: Colors.white),
                       enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                       ),
                       suffixIcon: Icon(Feather.getIconData('eye'),color: Colors.white,),
                       focusedBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                       )
                     ),
                   ),
                   SizedBox(height: 10,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       FlatButton(
                         textColor: Colors.white,
                         child: Text("Forgot Password"),
                         onPressed: ()=>null,
                       )
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
         Container(
           margin: const EdgeInsets.only(top: 2),
           child: MaterialButton(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20),
               ),
               child: Text("Login"),
               onPressed: ()=>null,
               color: Colors.white,
             ),
         ),
         
        ],
      ),
    );
  }
}