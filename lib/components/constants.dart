import 'package:flutter/material.dart';


const LIGHT_GREEN = Color.fromRGBO(60, 232, 211, 1);
const DARK_GREEN = Color.fromRGBO(0, 152, 161, 1);

const CRIMSON_RED = Color.fromRGBO(163, 35, 35, 1);
const DARK_RED = Color.fromRGBO(124, 2, 2, 1);
const LIGHT_RED = Color.fromRGBO(255, 126, 126, 1);

const WHITE_COLOR = Colors.white;
const BLACK_COLOR = Colors.black;

const LIGHT_GREY_COLOR = Color.fromRGBO(241, 241, 241, 1);

const DARK_ORANGE = Color.fromRGBO(214, 68, 5, 1);
const PALE_ORANGE = Color.fromRGBO(247, 126, 74, 1);

const BLUE_SHADOW = Color.fromRGBO(0, 172, 183, 0.2);
const ORANGE_SHADOW = Color.fromRGBO(254, 137, 0, 0.2);

const PURPLE_COLOR = Color.fromRGBO(115, 130, 255, 1);
const DARK_PURPLE_COLOR = Color.fromRGBO(28, 34, 87, 1);

const RED_GRADIENT = RadialGradient(
    center: Alignment.bottomRight, radius: 2, colors: [LIGHT_RED, DARK_RED]);

const BLUE_GRADIENT = LinearGradient(
    colors: [DARK_GREEN, LIGHT_GREEN],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const ORANGE_GRADIENT = LinearGradient(
    colors: [DARK_ORANGE, PALE_ORANGE],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);

const BRIGHT_ORANGE_GRADIENT =
LinearGradient(colors: [Color(0xFFD84708), Color(0xFFF77D48)]);