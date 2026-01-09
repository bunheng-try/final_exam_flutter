import 'package:flutter/material.dart';

import '../../models/comment.dart';
import '../../models/restaurant.dart';
import '../widgets/rating_star.dart';

class RestaurantCommentsForm extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsForm({super.key, required this.restaurant});

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final TextEditingController _feedbackController = TextEditingController();
  int _selectedRate = 0;
  String? _errorMessage;

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitComment() {
    setState(() {
      _errorMessage = null;
    });

    if (_feedbackController.text.trim().isEmpty) {
      setState(() {
        _errorMessage = 'Enter a feedback';
      });
      return;
    }
    final comment = Comment(
      feedback: _feedbackController.text.trim(),
      rate: _selectedRate,
    );
    widget.restaurant.addComment(comment);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'How was your Dinner?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Rate:'),
          DropdownButton<int>(
            value: _selectedRate,
            isExpanded: true,
            items: List.generate(6, (index) {
              return DropdownMenuItem(
                value: index,
                child: Row(
                  children: [
                    Text('$index'),
                    const SizedBox(width: 8),
                  ],
                ),
              );
            }),
            onChanged: (value) {
              setState(() {
                _selectedRate = value!;
              });
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: RatingStars(
              currentRating: _selectedRate,
              onRatingChanged: (rating) {
                setState(() {
                  _selectedRate = rating;
                });
              },
              size: 50.0,
              activeColor: Colors.amber,
              inactiveColor: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Text('Any feedback'),
          TextField(
            controller: _feedbackController,
            maxLines: 5,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter here',
              errorText: _errorMessage,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitComment,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 65, 205, 240),
              ),
              child: const Text(
                'COMMENT',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
