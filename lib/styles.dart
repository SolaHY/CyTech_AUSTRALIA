import 'package:flutter/material.dart';

const BoxDecoration gradientBackground = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.purple, Colors.blue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);

const TextStyle defaultTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
);
