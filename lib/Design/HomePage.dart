import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:medibuddy/Design/ClaimsPage.dart';
import 'package:medibuddy/Design/UserProfile.dart';
import 'package:medibuddy/Design/WalletScreen.dart';
import 'package:medibuddy/Design/gradients.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Feather.getIconData('github')),
        backgroundColor: const Color(0xFF495aff),
      ),
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Feather.getIconData('home')),
                color: const Color(0xFF495aff),
                onPressed: () => null,
              ),
              IconButton(
                icon: Icon(Feather.getIconData('shield')),
                color: Colors.grey,
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ClaimsPage()
                )),
              ),
              IconButton(
                icon: Icon(SimpleLineIcons.getIconData('wallet')),
                color: Colors.grey,
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>WalletScreen()
                )),
              ),
              IconButton(
                icon: Icon(Feather.getIconData('user')),
                color: Colors.grey,
                onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>UserProfile()
                )),
              )
            ],
          )),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CustomAppBar(),
                  UserData(),
                ],
              ),
              
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
            actions: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.asset("assets/images/boy.png"),
                ),
              )
            ],
            title: Text("MediBuddy"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 6),
            child: Text(
              "Hi, Jane Williams",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 19),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:32.0,top: 10,bottom: 10),
            child: Text("Here's claim report detail for your recent claims",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w200,color: Colors.white),),
          ),
          AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 400),
            child: Stack(
      children: [
        CarouselSlider(
              enableInfiniteScroll: true,
              height: 230,
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(milliseconds: 100),
              viewportFraction: 1.0,
              onPageChanged: (index){
                setState(() {
                  _current = index;
                });
              },
              items: [1,2,3,4,5].map((i){
                return ClaimCard();
              }).toList()
            ),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [1,2,3,4,5].map((index) {
                return AnimatedContainer(
                  width: _current==index? 9.0:4,
                  height: _current==index? 9.0:4,
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? const Color(0xFF495aff) : Color.fromRGBO(0, 0, 0, 0.4)
                  ),
                );
              }).toList(),
            )
        )
      ]
    ),
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
                  Text("Claim for Apollo Hospital, Bangalore, India",style: TextStyle(fontSize: 14,color: Colors.black45),)
                ],
              ),
            ),
          );
  }
}



class ClaimServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SingleClaimService(icon: AntDesign.getIconData('hearto'),title: "Health",),
            SingleClaimService(icon: Icons.refresh,title: "Renew",),
            SingleClaimService(icon: Icons.monetization_on,title: "Claims",)
          
          ],
        ),
      ),
    );
  }
}

class SingleClaimService extends StatelessWidget {
  final IconData icon;
  final String title;
  const SingleClaimService({Key key, this.icon, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
              decoration: BoxDecoration(
          
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Icon(icon,color: const Color(0xFF495aff),size: 34,),
            SizedBox(height: 10,),
            Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}

class SingleClaim extends StatelessWidget {
  final int index;

  const SingleClaim({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1,color: const Color(0xFF495aff))
              ),
              child: Icon(Icons.card_travel,color: const Color(0xFF495aff),),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Text("Travel Claim",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
              ],
            ),
            SizedBox(height: 5,),
            Text("Date of expire: 23 November 2019",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200),),
              SizedBox(height: 10,),
            CircularPercentIndicator(
              radius: 80,
              circularStrokeCap: CircularStrokeCap.round,
                lineWidth: 6.0,
                animation: true,
                percent: index%2==0? 1.0:0.6,
                progressColor: index%2==0?const Color(0xFF39C73D):const Color(0xFF495aff),
                center: new Text(
                 "Processing",
                  style:
                      new TextStyle(fontWeight: FontWeight.w200, fontSize: 8.0),
                ),
            )
          ],
        ),
      ),
      
    );
  }
}