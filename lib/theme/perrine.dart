import 'package:flutter/material.dart';

const Color mColor1 = const Color(0XFF00838F);

const Color mColorBlue1 = const Color(0XFFFF00BF);
const Color mColorBlue2 = const Color(0XFF3B7794);
const Color mColorBlue3 = const Color(0XFF005de3);
const Color mColorBlue4 = const Color(0XFF4fb3bf);
const Color mColorBlue5 = const Color(0XFF8000FF);

const Color mColorBlack1 = const Color(0XFF000000);
const Color mColorLink1 = const Color(0XFF0044fb);
const Color mColorShadow1 = const Color(0XFF454545);
const Color mColorShadow2 = const Color(0XFF494949);
const Color greyC= const Color(0XFFDDDDDD);
const Color mColorGreen1= const Color(0XFF58928f);
const Color mColorRed1= const Color(0XFFcb4a43);
const Color mColorGrey = const Color(0XFFc9c9c9);
const Color mColorGrey2 = const Color(0XFF454545);
const Color mColorGrey3 = const Color(0XFF7F7F7F);






const Color mainColorText = const Color(0XFF3FA535);
const Color cBlack = const Color(0XFF000000);

const LinearGradient gradient1 =  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [mColorBlue1, mColorBlue5]);


const LinearGradient gradient2 =  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [mColorBlue5, mColorBlue1]);

const LinearGradient gradient3 =  LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.white, Colors.white]);

const LinearGradient gradient4 =  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mColorBlue2, mColorBlue1]);


/// White Color

TextStyle styleAppBar1 = new TextStyle(
    color: Colors.white,
    fontSize: 40.0,
    fontFamily: 'font arab bold',
    fontWeight: FontWeight.w500);


TextStyle styleAppBarGreen = new TextStyle(
    color: mainColorText,
    fontSize: 50.0,
    fontFamily: 'font arab bold',
    fontWeight: FontWeight.w500);


TextStyle mStyle1 = new TextStyle(
    color: Colors.white,
    fontSize: 100.0,
    fontFamily: 'font arab bold',
    fontWeight: FontWeight.w900);


TextStyle mStyle1black = new TextStyle(
    color: Colors.black,
    fontSize: 150.0,
    fontFamily: 'font arab bold',
    fontWeight: FontWeight.w900);

TextStyle mStyle1ex = new TextStyle(
    color: Color.fromRGBO(80, 47, 136, 1),
    fontSize: 35.0,
    fontWeight: FontWeight.w500);

    TextStyle questionLetter = new TextStyle(
    color: Colors.red,
    fontSize: 35.0,
    fontWeight: FontWeight.w500);

TextStyle mStyleNext = new TextStyle(
    color: Colors.purple,
    fontSize: 25.0,
    fontWeight: FontWeight.w500);
TextStyle mStyleEntry = new TextStyle(
    color: Colors.white,
    fontSize: 25.0,
    fontWeight: FontWeight.w500);

TextStyle mStyle1exlt = new TextStyle(
    color: Colors.black,
    fontSize: 140.0,
    fontWeight: FontWeight.w500);


TextStyle mStyle1w600 = new TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600);

TextStyle mStyle3 = new TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600);

TextStyle mStyle17 = new TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
TextStyle mStyle20 = new TextStyle(
    color: Colors.white,
    fontSize: 7.0,
    fontWeight: FontWeight.w300);


/// Style with mColorBlue1 Color


TextStyle mStyle2 = new TextStyle(
  color: mColorBlue1,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle mStyle2w300 = new TextStyle(
  color: mColorBlue1,
  fontSize: 16,
  fontWeight: FontWeight.w300,
);

TextStyle mStyle6 = new TextStyle(
  color: mColor1,
  fontSize: 18,
  fontWeight: FontWeight.w300,
);
TextStyle mStyle6w600 = new TextStyle(
  color: mColorBlue1,
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

TextStyle styleBottomBar1 = new TextStyle(
    color: mColorBlue1,
    fontSize: 12.0,
    fontWeight: FontWeight.w400);


TextStyle mStyle7 = new TextStyle(
  color: mColorBlue1,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);

TextStyle mStyle7White = new TextStyle(
  color: mColorBlue1,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);



///Style with mColorBlue1 color

TextStyle mStyle5 = new TextStyle(
    color: mColorBlue1,
    fontSize: 16.0,
    fontWeight: FontWeight.w600);

TextStyle mStyle16blueLink = new TextStyle(
  color: mColorBlue3,
  fontSize: 10,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.normal,

);

TextStyle mStyle9blueLink = new TextStyle(
  color: mColorBlue3,
  decoration: TextDecoration.underline,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);



///style with Black color

TextStyle mStyle9 = new TextStyle(
  color: mColorGrey2,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);

TextStyle mStyle4 = new TextStyle(
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w600);

TextStyle mStyle11 = new TextStyle(
  fontFamily: 'Roboto',
  color: Colors.black38,
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);


TextStyle mStyle16 = new TextStyle(

  color: Colors.black38,
  fontSize: 12,
  fontWeight: FontWeight.w300,
  fontStyle: FontStyle.normal,

);

TextStyle mStyle13 = new TextStyle(
  color: mColorBlack1,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);


TextStyle mStyle14 = new TextStyle(
  color: mColorBlack1,
  fontSize: 18,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,
);

TextStyle mStyle15 = new TextStyle(
    color: const Color(0XF7F7F7F7),
    fontSize: 16.0,
    fontWeight: FontWeight.w600);






///style with grey color


TextStyle styleBottomBar2 = new TextStyle(
    color: Colors.grey,
    fontSize: 12.0,
    fontWeight: FontWeight.w400);

TextStyle styleBottomBar3 = new TextStyle(
    color: Colors.grey,
    fontSize: 12.0,
    fontWeight: FontWeight.w400);

TextStyle mStyle12 = new TextStyle(
  fontFamily: 'Roboto',
  color: Colors.grey,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);

TextStyle mStyle22 = new TextStyle(
  fontFamily: 'Roboto',
  color: Colors.grey,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);
TextStyle mStyle18 = new TextStyle(
  fontFamily: 'Roboto',
  color: mColorGrey2,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);
TextStyle mStyle19 = new TextStyle(
  color: mColorGrey2,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle mStyle15Shadow2 = new TextStyle(
  color: mColorShadow2,
  fontSize: 14,
  fontWeight: FontWeight.w300,
);


///style with red color

TextStyle mStyle8 = new TextStyle(
  color: mColorRed1,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);


///style with blue link color

TextStyle mStyle10 = new  TextStyle(
  fontFamily: 'Roboto',
  color: mColorLink1,
  decoration: TextDecoration.underline,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);


TextStyle mStyle10b = new  TextStyle(
  fontFamily: 'Roboto',
  color: mColorLink1,
  fontSize: 10,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.normal,

);



LinearGradient myGradiant1 = new LinearGradient(colors: [
  mColorBlue1,
  mColorBlue2 ],
    stops: [
      0,
      1
    ]
);