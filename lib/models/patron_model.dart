import 'package:flutter/material.dart';
import 'package:gatito_mimoso/game_state.dart';

class PatronModel {
  final String id;
  final Color color;
  final IconData icon;
  final Status status;

  PatronModel({
    required this.id,
    required this.color,
    required this.icon,
    required this.status,
  });
}
