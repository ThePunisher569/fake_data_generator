import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Constants {
  static const url = 'https://random-data-api.com/api/v2/';
  static const appName = 'Fake Data Generator';
  static const appDesc = 'Generate Random Information in below categories';

  static const contentList = [
    'Person',
    'Address',
    'Bank',
    'Beer',
    'Blood Type',
    'Appliance',
    'Credit Card',
  ];

  static const gradientList = [
    [Colors.purple, Colors.indigo, Colors.blue],
    [Colors.green, Colors.yellow, Colors.orange],
    [Colors.indigo, Colors.blue, Colors.green],
    [Colors.yellow, Colors.orange, Colors.red],
    [Colors.orange, Colors.red, Colors.purple],
    [Colors.blue, Colors.green, Colors.yellow],
    [Colors.red, Colors.purple, Colors.indigo],
  ];

  static const mixedColors = [
    Colors.yellow,
    Colors.purple,
    Colors.red,
    Colors.green,
    Colors.indigo,
    Colors.orange,
    Colors.blue,
  ];
}

const gapV8 = SizedBox(height: 8);
const gapV16 = SizedBox(height: 16);
const gapV24 = SizedBox(height: 24);
const gapV32 = SizedBox(height: 32);
const gapV40 = SizedBox(height: 40);
const gapV48 = SizedBox(height: 48);
const gapV56 = SizedBox(height: 56);
const gapV64 = SizedBox(height: 64);
const gapV72 = SizedBox(height: 72);
const gapV80 = SizedBox(height: 80);

const gapH8 = SizedBox(width: 8);
const gapH16 = SizedBox(width: 16);
const gapH24 = SizedBox(width: 24);
const gapH32 = SizedBox(width: 32);
const gapH40 = SizedBox(width: 40);
const gapH48 = SizedBox(width: 48);
const gapH56 = SizedBox(width: 56);
const gapH64 = SizedBox(width: 64);
const gapH72 = SizedBox(width: 72);
const gapH80 = SizedBox(width: 80);

// E881AC, FE7BAD,
final logger = Logger();
