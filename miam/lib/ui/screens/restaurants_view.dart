import 'package:flutter/material.dart';
import '../../models/restaurant.dart';
import '../../models/restaurant_type.dart';
import '../theme.dart';
import '../widgets/chip/restaurant_type_chip.dart';
import '../widgets/chip/stars_chip.dart';
import 'restaurant_comments_view.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key, required this.restaurants});

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool showOnlyKhmer = false;

  List<Restaurant> get filteredRestaurants {
    if (showOnlyKhmer) {
      return widget.restaurants
          .where((restaurant) => restaurant.type == RestaurantType.khmer)
          .toList();
    }
    return widget.restaurants;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: showOnlyKhmer,
                onChanged: (bool? value) {
                  setState(() {
                    showOnlyKhmer = value!;
                  });
                },
              ),
              const Text("Show only Khmer restaurants"),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return ListTile(
                  title: Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: AppTexts.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.address),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          StarsChip(rate: restaurant.averageRate),
                          const SizedBox(width: 8),
                          RestaurantTypeChip(type: restaurant.type),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantCommentsView(
                          restaurant: restaurant,
                        ),
                      ),
                    ).then((_) {
                      setState(() {});
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
