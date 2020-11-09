import 'package:flutter/material.dart';

class StringTween extends Tween<String> {
  StringTween({String begin, String end}) : super(begin: begin, end: end);

  @override
  String lerp(double t) {
    int index = (begin.length + (end.length - begin.length) * t).round();
    return end.length > begin.length
        ? end.substring(0, index)
        : begin.substring(0, index);
  }
}
