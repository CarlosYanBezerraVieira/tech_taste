import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste_alura/model/dish.dart';
import 'package:tech_taste_alura/model/restaurant.dart';
import 'package:tech_taste_alura/ui/_core/bg_provider.dart';
import 'package:tech_taste_alura/ui/_core/widgets/app_bar.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 32),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              Center(
                child: Image.asset(
                  'assets/${restaurant.imagePath}',
                  width: 128,
                ),
              ),
              Text(
                "Mais pedidos",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(restaurant.dishes.length, (index) {
                  final Dish dish = restaurant.dishes[index];
                  return ListTile(
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 48,
                    ),
                    title: Text(dish.name),
                    subtitle: Text(
                      "R\$${dish.price.toStringAsFixed(2)}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<BgProvider>().addDish(dish);   
                      },
                      icon: Icon(Icons.add),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
