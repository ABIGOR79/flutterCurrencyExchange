import 'package:flutter/material.dart';

double getTopSafePadding(BuildContext context) {
  var binding = WidgetsBinding.instance;
  // ignore: deprecated_member_use
  return MediaQueryData.fromWindow(binding.window).padding.top;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getBottomSafePadding(BuildContext context) {
  MediaQueryData data = MediaQuery.of(context);
  return data.padding.bottom;
}

Widget spacerVertical(double height) {
  return SizedBox(height: height);
}

Widget spacerHorizontal(double width) {
  return SizedBox(width: width);
}

Widget spacerAdaptive() {
  return Expanded(child: Container());
}
