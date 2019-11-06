import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        
        children: <Widget>[
          Container(
           color: const Color(0xFF495aff)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/2,
                
                color: const Color(0xFF495aff),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      title: Text("Wallet Balance"),
                      actions: <Widget>[
                        IconButton(icon: Icon(Feather.getIconData('bell')),onPressed: ()=>null,)
                      ],
                    ),
                    Spacer(),
                    
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hi Rohan,",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(FontAwesome.getIconData('rupee'),color: Colors.white,),
                          Text("18023",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Your current benefit balance",style: TextStyle(color: Colors.white,fontSize: 17),)
                  
                        ],
                      ),
                    ),
                    Spacer()
                    ],
                ),
              ),
               Container(
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              color: const Color(0xFFf1f1f1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24)
              ),
              
            ),
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 30,top: 30,bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Money Spent",style: TextStyle(color: const Color(0xFF495aff),fontSize: 21,fontWeight: FontWeight.w700),),
                  Spacer(),
                  Container(
                    height: 150,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context,index){
                          return Card(
                            elevation: 1,
                            child: Container(
                              margin: const EdgeInsets.only(right: 30),
                              padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(9),
                                    decoration: BoxDecoration(
                                      color: index%2==1?Colors.amber:const Color(0xFF495aff),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Icon(FontAwesome.getIconData('stethoscope'),color: Colors.white,),
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(FontAwesome.getIconData('rupee'),size: 20,),
                                      Text("1234",style: TextStyle(fontWeight: FontWeight.bold),),
                                      
                                    ],
                                  ),
                                  Text("Total Expense")
                                ],
                              ),
                            ),
                          );  
                        },
                      ),
                    ),
                  Spacer()
                ],
              ),
            )
          )
            ],
          )
         
        ],
      ),
    );
  }
}