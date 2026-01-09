import 'package:flutter/material.dart';
class RatingStars extends StatefulWidget {
  final int maxStars;
  final int currentRating;
  final ValueChanged<int> onRatingChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const RatingStars({
    super.key,
    this.maxStars = 5,
    required this.currentRating,
    required this.onRatingChanged,
    this.size = 40.0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  });

  @override
  State<RatingStars> createState() => _RatingStarsState();
}
class _RatingStarsState extends State<RatingStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () {
            widget.onRatingChanged(index + 1);
          },
          child: Icon(
            index < widget.currentRating ? Icons.star : Icons.star_border,
            size: widget.size,
            color: index < widget.currentRating
                ? widget.activeColor
                : widget.inactiveColor,
          ),
        );
      }),
    );
  }
}
