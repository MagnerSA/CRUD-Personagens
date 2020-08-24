import 'package:flutter/material.dart';

class Char {
  final String id;
  final String name;
  final String birth;
  final String imageUrl;

  const Char({
    this.id,
    @required this.name,
    @required this.birth,
    @required this.imageUrl,
  });
}