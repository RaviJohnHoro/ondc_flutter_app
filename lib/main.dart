import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondc_flutter_app/provider/cart_provider.dart';
import 'package:ondc_flutter_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

import 'view/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchProvider>(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
      ],
      child: const GetMaterialApp(
        home: MyApp(),
      ),
    ),
  );
}
