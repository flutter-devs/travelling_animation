import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelling/landingpage_view_model.dart';
import 'package:travelling/tickets.dart';
class MyHomePage extends StatefulWidget {
 int index ;


 MyHomePage({this.index});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  topImageView(size),
                textView(LandingPageViewModel().listOFLandingPage[widget.index].place,LandingPageViewModel().listOFLandingPage[widget.index].country),
                ratting(),
                quadImages(size),
              ],
            ),
          )
      ),
    );
  }

  textView(String s, String t) =>Container(
      margin: EdgeInsets.only(top: 30,left: 20),
      child:    RichText(
        text: TextSpan(
          text: "$s, ",
          style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color:Color(0xff888BB6),fontSize: 32),
          children: <TextSpan>[
            TextSpan(text: t,style:GoogleFonts.lato(
                fontStyle: FontStyle.normal, color:Color(0xff252B79),fontSize: 32,fontWeight: FontWeight.bold) ),

          ],
        ),
      )

  );

  topImageView(size) => Stack(
     children: <Widget>[
  ClipRRect(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(20.0),
    bottomRight: Radius.circular(20.0),
  ),
  child: Hero(
  tag: "image ${widget.index}",
  child: Image.asset(LandingPageViewModel().listOFLandingPage[widget.index].imageAsset,fit: BoxFit.fill
  ,height: size.height/1.95,width:size.width,),
  )),
       Positioned(
         top: 35,
           left: 20,
           child:InkWell(
             onTap:()=> Navigator.of(context).pop(),
               child: Icon(Icons.arrow_back_ios,size: 20,color: Color(0xff252B79),)) ),
     ],
  );

  ratting() =>Container(
    margin: EdgeInsets.only(top: 10 ,left: 20),
    child: Row(
      children: <Widget>[
        Icon(Icons.star,size: 24,color: Color(0xff252B79),),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text("4.7",style: GoogleFonts.lato(
              fontStyle: FontStyle.normal, color: Color(0xff252B79),fontSize: 17,fontWeight: FontWeight.bold),),
        ),
      ],
    ),
  );

  quadImages(Size size) =>Container(
    margin: EdgeInsets.only(top: 20,left: 20,right: 5),
    child:  Column(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisSize: MainAxisSize.min,
     children: <Widget>[
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           InkWell(
             onTap: ()
             {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Tickets()));
             },
             child: imageItemView(size ,"Tickets" ,"2",Color(0xff45CBFF),"assets/images/ticket_2.png"),
           ),
           imageItemView(size ,"Hotel",'',Color(0xff45CBFF),"assets/images/map.png"),

         ],
       ),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
         imageItemView(size,"Places","16",Color(0xff252B79),"assets/images/places.png"),
         imageItemView(size,"Temperature","21",Color(0xffF96F5E),"assets/images/temp.png"),
         ],
       )
     ],
   ),    );

  imageItemView(Size size, String s ,String t ,var color,String u) =>  Container(
    margin: EdgeInsets.only(right: 15,bottom: 15),
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(u,fit: BoxFit.fill
            ,height: 140,width:150,),
        ),
        Positioned(
          bottom: 10,
            left: 15,
            child: Text(s,style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: Color(0xff252B79),fontSize: 20,fontWeight: FontWeight.bold),))
       , Positioned(
          bottom: 45,
            left: 10,
            child: Text(t,style: GoogleFonts.lato(
            fontStyle: FontStyle.normal, color: color,fontSize: 32,fontWeight: FontWeight.bold),))
      ],
    ),
  );

}