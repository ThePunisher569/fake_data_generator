import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Constants {
  static const url = 'https://random-data-api.com/api/v2/';
  static const appName = 'Fake Data Generator';
  static const appDesc =
      'See different types of information generated randomly';

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
    [Colors.indigo, Colors.blue, Colors.green],
    [Colors.blue, Colors.green, Colors.yellow],
    [Colors.green, Colors.yellow, Colors.orange],
    [Colors.yellow, Colors.orange, Colors.red],
    [Colors.orange, Colors.red, Colors.purple],
    [Colors.red, Colors.purple, Colors.indigo],
  ];
}

final logger = Logger();
