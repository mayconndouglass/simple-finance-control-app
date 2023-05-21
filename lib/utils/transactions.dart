import 'package:flutter/material.dart';

class Transaction {
  final String description;
  final IconData icon;
  final DateTime date;
  final double value;

  Transaction({
    required this.description,
    required this.icon,
    required this.date,
    required this.value,
  });
}

