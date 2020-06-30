import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling/myhomepage.dart';

import 'landingpage_view_model.dart';
class LAndingPage extends StatefulWidget {
  @override
  _LAndingPageState createState() => _LAndingPageState();
}

class _LAndingPageState extends State<LAndingPage> {
  bool first_dot  = true;
  bool second_dot  = false;
  bool third_dot  = false;

  var hiMartinAnimatedText =60.0;

  var animatedtabBarLEft =70.0;

  var animatedImageHeight =120.0;

  var animatedImageWeight =160.0;

  var animateListImagesLeft =200.0;

  bool animatePropertiesORNot = true;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
if(animatePropertiesORNot == true)
  {
    animateProperties();
  }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              hiMartinText(),
              letsDiscover(),
              searchField(),
              flights_hotel(),
              yourTrips(),
              tabBar(size),
              listOfImages(size),
              SizedBox(height: 20,),
            ],
          ),
        ),

      ),
    );
  }

  appBar() =>Container(
    margin: EdgeInsets.only(top: 30),
    child: Row(
      children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 30),
                child: Image.asset("assets/images/drawer.png",fit: BoxFit.contain,width: 30,height: 30,)),
        Spacer(),
        Container(
          margin: EdgeInsets.only(right: 5),
            child: Image.asset("assets/images/gradient_icon.png",fit: BoxFit.contain,width: 18,height: 18,
            color: Color(0xff888BB6),)),
        Text("Los Angles,",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontSize: 17,fontWeight: FontWeight.bold),),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text("California",style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color: Color(0xff888BB6),fontSize: 17,fontWeight: FontWeight.bold),),
        ),
        Spacer(),
        Container(
            margin: EdgeInsets.only(right: 24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
                child: Image.asset("assets/images/profile_2.png",fit: BoxFit.fill,width: 50,height: 50,)))
      ],
    ),
  );

  hiMartinText() =>AnimatedContainer(
    duration: Duration(milliseconds: 600),
    curve: Curves.easeIn,
    margin: EdgeInsets.only(top: hiMartinAnimatedText,left: 30),
    child:    RichText(
      text: TextSpan(
        text: 'Hi, ',
        style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color:Color(0xff888BB6),fontSize: 32),
        children: <TextSpan>[
          TextSpan(text: 'Martin',style:GoogleFonts.lato(
              fontStyle: FontStyle.normal, color:Color(0xff252B79),fontSize: 32,fontWeight: FontWeight.bold) ),

        ],
      ),
    )

  );

  letsDiscover() =>Container(
    margin: EdgeInsets.only(top: 15,left: 30),
    child:         Text("Let's Discover A New Adventure!",style: GoogleFonts.lato(
        fontStyle: FontStyle.normal, color: Color(0xff888BB6),fontSize: 15),),
  );

  searchField() =>Container(
    padding: EdgeInsets.only(top: 40),
    margin: EdgeInsets.symmetric(horizontal:  30),
    child: TextFormField(
        textInputAction: TextInputAction.next,
        autofocus: false,
        textAlign: TextAlign.start,
        style: TextStyle(),
        decoration: InputDecoration(
        focusColor: Colors.transparent,
        fillColor: Colors.grey[200],
        hoverColor: Colors.transparent,
        //focusColor: Colors.transparent,
        filled: true,
        hintText: "  Search Hotels, Taxi etc...",
        prefixIcon: Container(margin: EdgeInsets.only(left: 15),child: Icon(Icons.search,color: Color(0xff252B79),size: 22,)),
        suffixIcon: Row( mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(color: Colors.grey[300],height: 25,width: 2,margin: EdgeInsets.only(right: 13,),),
          Container(
            margin: EdgeInsets.only(right: 20),
              child: Icon(Icons.keyboard_arrow_down,color: Colors.grey[400],size: 22,)),
          //  SizedBox(width: 10,)
        ],),
        hintStyle:GoogleFonts.lato(color: Color(0xff888BB6),fontSize: 14),
        labelStyle:  GoogleFonts.roboto(fontStyle: FontStyle.normal),
        contentPadding: EdgeInsets.only(left: 40, top: 8, bottom: 8,right: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    ),
  );

  flights_hotel() =>Container(
    margin: EdgeInsets.only(top: 40,left: 30,right: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        landingPageItemView("assets/images/aeroplane.png" ,"Flights",Color(0xff4DCCFF)),
        landingPageItemView("assets/images/hotel.png" ,"Hotels",Color(0xffFB9056)),
        landingPageItemView("assets/images/navigation.png" ,"Places",Color(0xff5F66EC)),
        landingPageItemView("assets/images/more.png" ,"More",Color(0xffF67061)),
      ],
    ),
  );

  landingPageItemView(String s, String t, Color color) =>   Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
        ),
        child: Center(child: Image.asset(s,fit: BoxFit.contain,width: 24,height: 24,color: Colors.white,)),
      ),
      Text(t,style: GoogleFonts.lato(
          fontStyle: FontStyle.normal, color: Color(0xff252B79),fontSize: 13,fontWeight: FontWeight.bold),)
    ],
  );

  yourTrips() =>Container(
      margin: EdgeInsets.only(top: 30,left: 30),
      child:    RichText(
        text: TextSpan(
          text: 'Your ',
          style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color:Color(0xff888BB6),fontSize: 32),
          children: <TextSpan>[
            TextSpan(text: 'Trips',style:GoogleFonts.lato(
                fontStyle: FontStyle.normal, color:Color(0xff252B79),fontSize: 32,fontWeight: FontWeight.bold) ),

          ],
        ),
      )

  );

  tabBar(size) =>AnimatedContainer(
    duration: Duration(milliseconds: 1000),
  //  curve: Curves.easeInOutBack,
    margin: EdgeInsets.only(top: 40,left: animatedtabBarLEft,right: 30),
    child: Row(
      children: <Widget>[
        InkWell(
          onTap: ()
          {
            setState(() {
              first_dot =true;
              second_dot =false;
              third_dot =false;
            });
            animateListView(size);
          },
          child: tabBarFirstItem("Futured" ,first_dot),
        ),
        Spacer(),
        InkWell(
          onTap: ()
          {
            setState(() {
              first_dot =false;
              second_dot =true;
              third_dot =false;
              animateListView(size);
            });
          },
          child:  tabBarFirstItem("Past" ,second_dot),
        ),

        Spacer(),
        InkWell(
          onTap: ()
          {
            setState(() {
              first_dot =false;
              second_dot =false;
              third_dot =true;
              animateListView(size);
            });
          },
          child:  tabBarFirstItem("All" ,third_dot),
        ),

        Spacer(flex: 2,),
      ],
    ),
  );

  tabBarFirstItem(String s , var itemVisibility) =>  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(s,style: GoogleFonts.lato(
          fontStyle: FontStyle.normal, color: Color(0xff888BB6)),),
      itemVisibility ?Container(
        margin: EdgeInsets.only(top: 10),
        height: 6,
        width: 6,
        decoration: BoxDecoration(
            color: Color(0xff888BB6),
            shape: BoxShape.circle
        ),):Container(
        margin: EdgeInsets.only(top: 10),
        width: 6,
        height: 6,
      ),
    ],
  );

  listOfImages(size) =>AnimatedContainer(
    duration: Duration(milliseconds: 700),
    curve: Curves.easeInOutBack,
    margin: EdgeInsets.only(left: animateListImagesLeft,top: 20),
    height: 200,
    width: size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
        itemBuilder: (context ,index)=>listOFImageItemView(index)),
  );

  listOFImageItemView(int index) =>Container(

    margin: EdgeInsets.only(right: 10),
    child: Stack(
      children: <Widget>[
        InkWell(
          onTap: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(index: index,)));
          },
          child:Container(

            height: 200,width:180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
                child: Hero(
                  tag: "image $index",
                  child: Image.asset(LandingPageViewModel().listOFLandingPage[index].imageAsset,fit: BoxFit.fill
                  ),
                )),
          ),
        ),
       Positioned(
         top: 15,
           left: 15,
           child: Text(LandingPageViewModel().listOFLandingPage[index].place,style: GoogleFonts.lato(
               fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 16),)),
       Positioned(
         top: 40,
           left: 15,
           child: Row(
          children: <Widget>[
            Image.asset("assets/images/gradient_icon.png",fit: BoxFit.contain,width: 18,height: 18,),
            Text(LandingPageViewModel().listOFLandingPage[index].country,style: GoogleFonts.lato(
                fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 16),)
          ],
           ))
      ],
    ),
  );
  void animateProperties() {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
        hiMartinAnimatedText = 30.0;
        animatedtabBarLEft = 30.0;
        animatedImageHeight =250;
        animatedImageWeight= 180;
        animateListImagesLeft = 20.0;
      });
    });
  }

  void animateListView(size) {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
       animateListImagesLeft = size.width;
       animatePropertiesORNot = false;
      });
    });
    Timer(const Duration(milliseconds: 600), () {
      setState(() {
        animatePropertiesORNot =true;
      });
    });
  }





}
