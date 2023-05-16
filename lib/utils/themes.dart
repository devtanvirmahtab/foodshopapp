import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFFF4667);
const Color white = Colors.white;
const  primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes{
  static final light =  ThemeData(
    primaryColor:primaryClr,
    backgroundColor: white,
    scaffoldBackgroundColor: Colors.white
  );

  static final dark =  ThemeData(
    brightness: Brightness.dark,
      primaryColor:primaryClr,
      backgroundColor: darkGreyClr
  );
}

TextStyle  get bigTitleStyle  {
  return GoogleFonts.lato(
    textStyle: const  TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: Colors.black
    )
  );
}

TextStyle  get titleStyle  {
  return GoogleFonts.lato(
      textStyle: const  TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.black
      )
  );
}

TextStyle  get textStyle  {
  return GoogleFonts.lato(
      textStyle: const  TextStyle(
          fontSize: 16,
          color: Colors.grey
      )
  );
}

TextStyle  get buttonTextStyle  {
  return GoogleFonts.lato(
      textStyle: const  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white
      )
  );
}

TextStyle  get cardTitleStyle  {
  return GoogleFonts.lato(
      textStyle: const  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black
      )
  );
}

TextStyle  get subCardTitleStyle  {
  return GoogleFonts.lato(
      textStyle: const  TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black
      )
  );
}