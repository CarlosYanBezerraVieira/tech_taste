import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste_alura/ui/_core/bg_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tech_taste_alura/ui/checkout/checkout_screen.dart';

AppBar getAppbar({required BuildContext context, String? title}) {
  BgProvider bgProvider = Provider.of<BgProvider>(context);

  return AppBar(
    title: title != null ? Text(title) : null,
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: bgProvider.dishesOnBag.isNotEmpty,
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        badgeContent: Text(
          bgProvider.dishesOnBag.length.toString(),
          style: const TextStyle(fontSize: 10),
        ),
        child: IconButton(onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => const CheckoutScreen()) );
        }, icon: Icon(Icons.shopping_basket)),
      ),
    ],
  );
}
