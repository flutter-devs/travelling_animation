import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling/landingpage_view_model.dart';
class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {

  var animatedBackgroundHeight =60.0;

  var animatedTopFirstCard =60.0;

  var animatedPlaneMoving = 50.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    animateProperties(size);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              animatedBackGround(size),
              firstCard(size),
              secondCard(size),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  animatedBackGround(Size size) =>Stack(
    children: <Widget>[
      Container(height: size.height/1.8,color: Colors.transparent,),
  AnimatedContainer(
    duration: Duration(milliseconds: 700),
  curve: Curves.easeIn,
  height: animatedBackgroundHeight,
    decoration: BoxDecoration(
        color: Color(0xff5F66EC),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )
    ),
  ),
      Positioned(
        top: 40,
        child: appBar(size),
      ),
      Positioned
        (
          top: 140,
          child: Container(
            width: size.width,
            child: Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset("assets/images/place.png",fit: BoxFit.fill
                ,height: 240,width:size.width*0.85,)),
            ),
          ))

    ],
  );

  appBar(Size size) =>Container(
   // color: Colors.red,
    margin: EdgeInsets.only(left: 25,right: 22),
    width: size.width*0.9,
    child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap:()=> Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
        Text("Ticket",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),),
        Image.asset("assets/images/icon_ticket.png",fit: BoxFit.contain,width: 15,height: 15,color: Colors.white,)

      ],
    ),
  );

  firstCard(size) =>AnimatedContainer(
    duration: Duration(milliseconds: 600),
    curve: Curves.easeIn,
    margin: EdgeInsets.only(top: animatedTopFirstCard,left: 20,right: 20),
    child: Card(
     // color: Colors.lightGreenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 25,),
          flightTowards(size,"LAX","LGV",Color(0xff5F66EC),Color(0xffFB914C)),
          SizedBox(height: 10,),

          flightDetail(size),
          SizedBox(height: 35,),
          flightTiming(size),
          SizedBox(height: 10,),
          flightDate(size,"September 2,2020","September 3,2020"),
          SizedBox(height: 35,),

          flightPrice(size),
          SizedBox(height: 25,),
        ],
      ),
    ),
  );

  flightTowards(size,String s,String u,var color,var color_2) =>Container(
   // color: Colors.blue,
    child: Row(
    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Container(
      margin: EdgeInsets.only(left: 22,right: 5),
      child: Text(s,style: GoogleFonts.lato(
          fontStyle: FontStyle.normal, color: color,fontSize: 18,fontWeight: FontWeight.bold),),
      ),
        dotView(Color(0xffD5D4FC) ,Color(0xff5F66EC)),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
             //   color: Colors.red,
                child: Image.asset("assets/images/plane_back.png",fit: BoxFit.fill
                  ,width:size.width*0.49,height: 20,color: Colors.grey[300],),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                curve: Curves.easeIn,
                left: animatedPlaneMoving,
                top: -2,
                child: Image.asset("assets/images/plane.png",fit: BoxFit.fitWidth
                  ,width:24,height: 24,color: Colors.black,),
              )
            ],
          ),
        ),
        dotView(Color(0xffFDD7BD) ,Color(0xffFB9046)),
        Container(

          margin: EdgeInsets.only(right: 22,left: 5),
          child: Text(u,style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color: color_2,fontSize: 18,fontWeight: FontWeight.bold),),
        ),


      ],
    ),
  );

  flightDetail(size) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 10),
        child: Text("Los Angeles",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),
      Container(
        margin: EdgeInsets.only(left: 20,right: 10),
        child: Text("10h 20m",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 14),),
      ),
      Container(

        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text("London",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),


    ],
  );

  flightPrice(size) =>Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 5),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(150.0),
            child: Image.asset("assets/images/flight_logo.png",fit: BoxFit.fill,width: 50,height: 50,)),
      ),
      Container(
        margin: EdgeInsets.only(left: 5),
        child: Text("Norwegion Air",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE),fontWeight: FontWeight.w600,fontSize:16),),
      ),
      Spacer(),
      Container(

        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text("\$ 231",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 18),),
      ),


    ],
  );

  flightTiming(size) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 10),
        child: Text("03:20 PM",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 18),),
      ),

      Container(

        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text("09:40 AM",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 18),),
      ),


    ],
  );

  flightDate(size,String s , String t) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 10),
        child: Text(s,style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),

      Container(
        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text(t,style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),


    ],
  );

  secondCard(Size size) =>AnimatedContainer(
    duration: Duration(milliseconds: 600),
    curve: Curves.easeIn,
    margin: EdgeInsets.only(top: animatedTopFirstCard,left: 20,right: 20),
    child: Card(
      // color: Colors.lightGreenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2.0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 25,),
          flightTowards(size,"LGV","LAX",Color(0xffFB914C),Color(0xff5F66EC),),
          SizedBox(height: 10,),

          flightDetail_2(size),
          SizedBox(height: 35,),
          flightTiming_2(size),
          SizedBox(height: 10,),
          flightDate(size,"September 17,2020","September 18,2020"),
          SizedBox(height: 35,),
          flightPrice(size),
          SizedBox(height: 25,),
        ],
      ),
    ),
  );

  flightTowards_2(Size size) =>Container(
    // color: Colors.blue,
    child: Row(
      children: <Widget>[


        Container(

          margin: EdgeInsets.only(left: 22,right: 5),
          child: Text("LGV",style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color: Color(0xffFB914C),fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: Image.asset("assets/images/drawer.png",fit: BoxFit.fitWidth
            ,width:200,height: 20,color: Colors.black,),
        ),
        Container(

          margin: EdgeInsets.only(right: 22,left: 5),
          child: Text("LAX",style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color: Color(0xff5F66EC),fontSize: 20,fontWeight: FontWeight.bold),),
        ),

      ],
    ),
  );

  flightDetail_2(Size size) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 10),
        child: Text("London",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),
      Container(
        margin: EdgeInsets.only(left: 20,right: 10),
        child: Text("11h 20m",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 14),),
      ),
      Container(

        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text("Los Angeles",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xffAEAFCE)),),
      ),


    ],
  );

  flightTiming_2(Size size) =>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 22,right: 10),
        child: Text("02:10 PM",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 18),),
      ),

      Container(

        margin: EdgeInsets.only(right: 22,left: 10),
        child: Text("05:30 AM",style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontWeight: FontWeight.bold,fontSize: 18),),
      ),


    ],
  );

  void animateProperties(Size size) {
    Timer(const Duration(microseconds: 0), () {
      setState(() {
        animatedBackgroundHeight= size.height/2.5;
        animatedTopFirstCard =20.0;
        animatedPlaneMoving =90.0;
      });
    });
  }

  dotView(var red, var blue) =>        Container(
    height: 13,
    width: 13,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: red,
    ),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 3,vertical: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blue,
      ),
    ),
  );
}
