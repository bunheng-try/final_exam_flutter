import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import 'restaurant_comments_form.dart';
import '../theme.dart';

class RestaurantCommentsView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsView({super.key, required this.restaurant});

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Text(widget.restaurant.name),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.main,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      fontSize: AppTexts.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    widget.restaurant.address,
                    style: TextStyle(fontSize: AppTexts.normal),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RestaurantTypeChip(type: widget.restaurant.type),
                    const SizedBox(width: 8),
                    StarsChip(rate: widget.restaurant.averageRate),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: widget.restaurant.comments.isEmpty
                ? const Center(
                    child: Text('No comments yet'),
                  )
                : ListView.builder(
                    itemCount: widget.restaurant.comments.length,
                    itemBuilder: (context, index) {
                      final comment = widget.restaurant.comments[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: ListTile(
                          title: Text(comment.feedback),
                          trailing: Text(
                            comment.rate.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.main,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => RestaurantCommentsForm(
              restaurant: widget.restaurant,
            ),
          ).then((_) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
