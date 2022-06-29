import 'package:flutter/painting.dart';

const kMainBackgroundImage = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("images/asset-1.png"),
    fit: BoxFit.cover,
  ),
);

const kWhiteBackground = const BoxDecoration(
  color: Color(0xDDFFFFFF),
);