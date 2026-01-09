import 'package:flutter/material.dart';
import 'package:miam_1/models/comment.dart';

import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Street 174, Phnom Penh',
        type: RestaurantType.khmer,
        comments: [ 
          Comment(feedback: 'Wow thats amazing', rate: 4),
          Comment(feedback: 'Its just normal burger', rate: 2)
          ],
      ),
      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Sisowath Quay, Phnom Penh',
        type: RestaurantType.french,
      ),
      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.italian,
        comments: [ 
          Comment(feedback: 'I love pizzaaaa', rate: 5)
          ],
      ),
      Restaurant(
        name: 'Final Tacos',
        address: 'Street Exam, Phnom Penh',
        type: RestaurantType.mexican,
        comments: [ 
          Comment(feedback: 'Look like the original one!! wow!!', rate: 4),
          Comment(feedback: 'Wow thats amazing', rate: 5)
          ],
      ),
      Restaurant(
        name: 'No money no Rice',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.streetfood,
        comments: [ 
          Comment(feedback: 'Your rice is amazing wow!!', rate: 4),
          Comment(feedback: 'Not good at all', rate: 1)
          ],
      ),
      Restaurant(
        name: 'Ronano the Besto',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
                comments: [ 
          Comment(feedback: 'Yessss!!! RONAN THE BEST', rate: 5)
          ],
      ),
      Restaurant(
        name: 'Bay chaa',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
                comments: [ 
          Comment(feedback: 'Bay chaa e yummy', rate: 5)
          ],
      ),
    ];
    return result;
  }
}
