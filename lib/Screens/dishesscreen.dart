import 'package:flutter/material.dart';
import 'package:my_first_project/Screens/dish_details.dart';

class Dish {
  final String name;
  final String description;
  final double price;
  final String photo;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.photo,
  });
}

class DishesListScreen extends StatelessWidget {
  const DishesListScreen({super.key});

  // Sample list of famous dishes from Hunza
  static final List<Dish> dishes = [
    Dish(
      name: 'Hunza Bread',
      description:
          'Hunza bread is a traditional, dense, and nutrient-rich flatbread made from whole wheat or barley.',
      price: 200.0,
      photo: 'assets/Pictures/fheti.jpeg',
    ),
    Dish(
      name: 'Chapshuro',
      description:
          'A traditional meat pie filled with seasoned meat and vegetables.',
      price: 500.0,
      photo: 'assets/Pictures/chapshoro.PNG',
    ),
    Dish(
      name: 'Harissa',
      description: 'A slow-cooked dish made with wheat, barley, and meat.',
      price: 450.0,
      photo: 'assets/Pictures/harissa.jpeg',
    ),
    Dish(
      name: 'Gyal',
      description:
          'A type of flatbread made from whole wheat flour, butter, and apricot oil.',
      price: 150.0,
      photo: 'assets/Pictures/goli.jpg',
    ),
    Dish(
      name: 'Diram Phitti',
      description:
          'A sweet dish made from wheat flour and apricot oil, often served with butter or cream.',
      price: 300.0,
      photo: 'assets/Pictures/deram.jpeg',
    ),
    Dish(
      name: 'Hoilo Garma',
      description:
          'Hoilo Grma is a traditional Hunza dish made from dried apricots cooked with wheat flour and butter, often enjoyed as a sweet dessert or snack.',
      price: 200.0,
      photo: 'assets/Pictures/Hoilo garma.jpg',
    ),

    // Add more dishes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Famous Dishes of Hunza'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: dishes.length,
          itemBuilder: (context, index) {
            Dish dish = dishes[index];

            return SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push<void>(MaterialPageRoute<void>(
                    builder: (BuildContext context) => DishDetails(
                      dish: dish,
                    ),
                  ));
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: Colors.blueGrey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            dish.photo,
                            width: 130,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 50),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment:
                                CrossAxisAlignment.start, // FIXED HERE
                            children: [
                              Text(
                                dish.name,
                                style: const TextStyle(fontSize: 25),
                                overflow:
                                    TextOverflow.ellipsis, // Prevents overflow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
