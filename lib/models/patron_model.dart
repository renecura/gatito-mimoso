import 'package:flutter/material.dart';
import 'package:gatito_mimoso/game_state.dart';

class PatronModel {
  final String id;
  final Color color;
  final IconData? icon;
  final String? imagePath;
  final Status status;

  PatronModel({
    required this.id,
    required this.color,
    this.icon,
    this.imagePath,
    required this.status,
  });
}
