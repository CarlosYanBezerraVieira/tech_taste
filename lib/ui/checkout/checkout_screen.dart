import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste_alura/model/dish.dart';
import 'package:tech_taste_alura/ui/_core/app_colors.dart';
import 'package:tech_taste_alura/ui/_core/bg_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BgProvider bgProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sacola'),
        actions: [
          TextButton(
            onPressed: () {
              bgProvider.clearBag();
            },
            child: Text('Limpar', style: TextStyle(color: AppColors.mainColor)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Pedidos', textAlign: TextAlign.start),
              Column(
                children: List.generate(
                  bgProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish = bgProvider.getMapByAmount().keys.elementAt(
                      index,
                    );
                    int amount = bgProvider.getMapByAmount()[dish]!;

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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              bgProvider.removeDish(dish);
                            },
                            icon: Icon(Icons.remove),
                          ),

                          Text(
                            amount.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            onPressed: () {
                              bgProvider.addDish(dish);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
