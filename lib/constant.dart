import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final kTitleTextStyle = GoogleFonts.getFont(
  'Ubuntu',
  color: Colors.white,
  fontSize: 45.0,
);

final kSubtitleTextStyle = GoogleFonts.getFont(
  'Dancing Script',
  color: Colors.white,
  fontSize: 35.0,
);

const kTextFieldDecoration = InputDecoration(
  labelText: '',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
