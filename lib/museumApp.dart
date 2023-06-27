// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:monalisa/artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const Artwork(title: "Museum"),
    );
  }
}