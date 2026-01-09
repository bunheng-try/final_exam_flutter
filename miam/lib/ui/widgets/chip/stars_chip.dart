// Widget to disaply a restaurant stars chip
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  final double rate;

  const StarsChip({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        size: 18,
        color: Colors.orange,
      ),
      label: Text(rate.toStringAsFixed(1)),
      backgroundColor: Colors.white,
    );
  }
}