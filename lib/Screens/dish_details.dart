import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/dishesscreen.dart';

class DishDetails extends StatelessWidget {
  const DishDetails({super.key, required this.dish});
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: ListView(
        children: [
          Image(
            image: AssetImage(dish.photo),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Text(
            dish.name,
            style: const TextStyle(fontSize: 25),
            overflow: TextOverflow.ellipsis, // Prevents overflow
          ),
          Text(
            dish.description,
            style: const TextStyle(fontSize: 15),
            maxLines: 2, // Restricts to two lines
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '\$${dish.price.toString()}',
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
