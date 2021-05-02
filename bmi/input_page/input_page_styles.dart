import 'package:yoga_guru/bmi/widget_utils.dart';
import 'package:flutter/material.dart';

double appBarHeight(BuildContext context) {
  return screenAwareSize(80.0, context) + MediaQuery.of(context).padding.top;
}