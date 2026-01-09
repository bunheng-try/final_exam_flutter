import 'comment.dart';
import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<Comment> comments;
 
  Restaurant({
    required this.name,
    required this.address,
    required this.type,
    List<Comment>? comments,
  }) : comments = comments ?? [];

  double get averageRate {
    if (comments.isEmpty) return 0.0;
    double sum = 0;
    for (var comment in comments) {
      sum += comment.rate;
    }
    return sum / comments.length;
  }

  void addComment(Comment comment) {
    comments.add(comment);
  }
}
