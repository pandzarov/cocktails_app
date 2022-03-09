import 'package:flutter/material.dart';

const kMainUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";

const primary = Color(0xff4f359b);
const white = Color(0xffffffff);
const kBackgroundColor = Color(0XFF1F2129);
const kComponentsColor = Color(0xFF3C4D74);
const kGroupBackgroundColor = Color(0xFF383D4D);

const kHeaderTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const kTableTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const kBorderSide = BorderSide(
  color: kComponentsColor,
  width: 5,
);

const kBoxDecorationStyle = BoxDecoration(
  color: kGroupBackgroundColor,
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const kButtonMinSize = Size(100, 55);
